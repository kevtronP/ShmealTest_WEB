var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      selectedFile: null,
      userName: "",
      lastName: "",
      userPhoneNumber: "",
      location: "",
      userEmail: "",
      password: "",
      passwordConfirmation: "",
      errors: [],
      userid: {},
      user: {
        params: {}
      }
    };
  },
  created: function() {
    var userlocation = {};

    axios.get("/fetchimage").then(function(response) {
      this.key = response.data;
      console.log(this.key);
      AWS.config.update({
        accessKeyId: this.key.access_key_id,
        secretAccessKey: this.key.secret_access_key
      });
    });

    var infoWindow = new google.maps.InfoWindow();
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        function(position) {
          var pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude
          };

          infoWindow.setPosition(pos);
          console.log(pos);
          userlocation = pos;
          console.log(userlocation);
          this.userlocation = userlocation;
        },
        function() {
          handleLocationError(true, infoWindow);
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow);
    }
  },

  methods: {
    submit: function() {
      var s3 = new AWS.S3({
        params: { Bucket: "kevinshmealphotos" }
      });

      console.log(this.selectedFile);

      s3.upload(
        {
          Key: this.userEmail + "profpic.png",
          Body: this.selectedFile,
          ACL: "public-read"
        },
        function(err, data) {
          if (err) {
            return alert(
              "There was an error uploading your photo: ",
              err.message
            );
          }

          alert("Successfully uploaded photo.");
        }
      );

      var user = {
        userName: this.userName,
        lastName: this.lastName,
        userPhoneNumber: this.userPhoneNumber,
        userEmail: this.userEmail,
        userDate: new Date()
      };

      axios
        .post("users", user)

        .then(function(response) {
          this.userid = response.data;
          var shmuserattribute = {
            shmuserattribute: {
              attributeName: "userHomeLat",
              userAttribute: this.userlocation.lat,
              attributeDate: new Date(),
              userID: this.userid.id
            }
          };

          axios.post("shmuserattributes", shmuserattribute);
        })
        .then(function() {
          var shmuserattribute = {
            shmuserattribute: {
              attributeName: "userHomeLon",
              userAttribute: this.userlocation.lng,
              attributeDate: new Date(),
              userID: this.userid.id
            }
          };

          axios.post("shmuserattributes", shmuserattribute);
        })
        .then(function() {
          var shmuserattribute = {
            shmuserattribute: {
              attributeName: "profPicURL",
              userAttribute: user.userEmail + "profpic.png",
              attributeDate: new Date(),
              userID: this.userid.id
            }
          };

          axios.post("shmuserattributes", shmuserattribute);
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
      router.push("/login");
    },

    onFileSelected: function(event) {
      this.selectedFile = event.target.files[0];
      document.getElementById("preview").src = window.URL.createObjectURL(
        this.selectedFile
      );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "kmerc5187@gmail.com",
      password: "K@ppa123",
      errors: []
    };
  },
  created: function() {
    axios.get("/fetchimage").then(function(response) {
      this.key = response.data;
      console.log(this.key);
      var poolData = {
        UserPoolId: this.key.pool_id,
        ClientId: this.key.client_id
      };
      this.poolData = poolData;
    });
  },

  methods: {
    submit: function() {
      var authenticationData = {
        Username: this.email,
        Password: this.password
      };
      var authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails(
        authenticationData
      );
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
      var userData = {
        Username: this.email,
        Pool: userPool
      };
      var cognitoUser = new AmazonCognitoIdentity.CognitoUser(userData);
      cognitoUser.authenticateUser(authenticationDetails, {
        onSuccess: function(result) {
          var accessToken = result.getAccessToken().getJwtToken();

          /* Use the idToken for Logins Map when Federating User Pools with identity pools or when passing through an Authorization Header to an API Gateway Authorizer*/
          var idToken = result.idToken.jwtToken;
        },

        onFailure: function(err) {
          alert(err);
        }
      });
      router.push("/");
    }
  }
};

var CreateAccount = {
  template: "#createaccount-page",
  data: function() {
    return {
      userName: "Kevin",
      lastName: "Mercado",
      userPhoneNumber: "+17083360936",
      location: "",
      userEmail: "kmerc5187@gmail.com",
      userPassword: "K@ppa123",
      passwordConfirmation: "K@ppa123",
      poolData: {},
      newUser: {},
      emailVerification: "",
      phoneVerification: "",
      cognitoUser: "",
      errors: []
    };
  },
  created: function() {
    axios.get("/fetchimage").then(function(response) {
      this.key = response.data;
      console.log(this.key);
      var poolData = {
        UserPoolId: this.key.pool_id,
        ClientId: this.key.client_id
      };
      this.poolData = poolData;
    });
  },
  methods: {
    sendData: function() {
      var newUser = {
        firstname: this.userName,
        lastname: this.lastName,
        email: this.userEmail,
        phone: this.userPhoneNumber,
        password: this.userPassword
      };
      this.newUser = newUser;
      console.log(this.newUser);
    },

    submit: function() {
      // var AmazonCognitoIdentity = require("amazon-cognito-identity-js");
      console.log(this.newUser);
      var CognitoUserPool = AmazonCognitoIdentity.CognitoUserPool;
      console.log(poolData);
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

      var attributeList = [];

      var dataEmail = {
        Name: "email",
        Value: this.newUser.email
      };
      var dataPhoneNumber = {
        Name: "phone_number",
        Value: this.newUser.phone
      };
      var attributeEmail = new AmazonCognitoIdentity.CognitoUserAttribute(
        dataEmail
      );
      var attributePhoneNumber = new AmazonCognitoIdentity.CognitoUserAttribute(
        dataPhoneNumber
      );
      console.log(dataEmail.Value);
      attributeList.push(attributeEmail);
      attributeList.push(attributePhoneNumber);

      userPool.signUp(
        dataEmail.Value,
        this.newUser.password,
        attributeList,
        null,
        function(err, result) {
          if (err) {
            alert(err);
            return;
          }
          cognitoUser = result.user;
          console.log("user name is " + cognitoUser.getUsername());
        }
      );
    },
    check: function() {
      console.log(this.newUser);
    },
    verifyphone: function() {
      cognitoUser.confirmRegistration(this.phoneVerification, true, function(
        err,
        result
      ) {
        if (err) {
          alert(err);
          return;
        }
        console.log("call result: " + result);
      });
    },
    login: function() {
      var authenticationData = {
        Username: this.newUser.email,
        Password: this.newUser.password
      };
      var authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails(
        authenticationData
      );
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
      var userData = {
        Username: this.newUser.email,
        Pool: userPool
      };
      var cognitoUser = new AmazonCognitoIdentity.CognitoUser(userData);

      cognitoUser.authenticateUser(authenticationDetails, {
        onSuccess: function(result) {
          var accessToken = result.getAccessToken().getJwtToken();

          var idToken = result.idToken.jwtToken;
          if (cognitoUser != null) {
            cognitoUser.getSession(function(err, session) {
              if (err) {
                alert(err);
                return;
              }
              console.log(
                "session validity: " + session.isValid() + cognitoUser.username
              );
            });
            cognitoUser.getAttributeVerificationCode("email", {
              onSuccess: function(result) {
                console.log("call result: " + result);
              },
              onFailure: function(err) {
                alert(err);
              },
              inputVerificationCode: function() {
                var verificationCode = prompt(
                  "Please input verification code: ",
                  ""
                );
                cognitoUser.verifyAttribute("email", verificationCode, this);
              }
            });
          }
        },

        onFailure: function(err) {
          alert(err);
        }
      });
    },
    verifyemail: function() {}
  }
};
