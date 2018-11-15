/* global Vue, VueRouter, axios, google, moment, AWS */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Hello there,",
      shmeals: [],
      shmealsWithData: [],
      key: {},
      idFilter: "",
      MenuItemIDFilter: "",
      sortAttribute: "attributeDate",
      sortAscending: true,
      updatedShmeals: {},
      clg: [],
      dz: {},
      timeArray: [],
      currentShmeal: {
        shmeal: {},
        CSdescription: "hello",
        CSstartTime: 0,
        CSendTime: ""
      }
    };
  },

  created: function() {
    axios.get("/fetchimage").then(function(response) {
      this.key = response.data;
      console.log(this.key);
      AWS.config.update({
        accessKeyId: this.key.access_key_id,
        secretAccessKey: this.key.secret_access_key
      });
    });

    axios.get("/upcoming").then(
      function(response) {
        this.shmeals = response.data;

        var locations = [];

        var map = new google.maps.Map(document.getElementById("map"), {
          zoom: 8,
          center: new google.maps.LatLng(41.9, -87.65)
        });

        var i = 1;
        var n = 1;

        var updatedShmeals = [];
        var bounds = new google.maps.LatLngBounds();

        this.shmeals.forEach(function(shmeal) {
          var lat = [];
          var lng = [];

          shmeal.menuitem.user.shmuserattributes.forEach(function(attribute) {
            if (attribute.attributeName === "userHomeLat") {
              lat.push(attribute.userAttribute);
            } else if (attribute.attributeName === "userHomeLon") {
              lng.push(attribute.userAttribute);
            }
          });
          i++;

          var infowindow = new google.maps.InfoWindow();
          var marker = new google.maps.Marker({
            position: {
              lat: Number(lat[0]),
              lng: Number(lng[0])
            },
            map: map,
            title: "Hello World!"
          });

          //extend the bounds to include each marker's position
          bounds.extend(marker.position);

          google.maps.event.addListener(
            marker,
            "click",
            (function(marker, i) {
              return function() {
                infowindow.setContent(locations[i][0]);
                infowindow.open(map, marker);
              };
            })(marker, i)
          );

          //now fit the map to the newly inclusive bounds
          map.fitBounds(bounds);
          map.panToBounds(bounds);

          // (optional) restore the zoom level after the map is done scaling
          var listener = google.maps.event.addListener(map, "idle", function() {
            map.setZoom(map.getZoom() - 0.4);
            google.maps.event.removeListener(listener);
          });
          marker.setMap(map);

          var shmealPlus = {
            shmeal: shmeal,
            lat: lat[0],
            lng: lng[0],

            startTime: function() {
              var startTimesArray = [];
              this.shmeal.shmshmealattributes.forEach(function(attribute) {
                if (attribute.attributeName === "startTime") {
                  startTimesArray.push(attribute);
                }
              });

              var sortedStartTimes = startTimesArray.sort(
                function(startTime1, startTime2) {
                  var startTimeDate1 = new Date(startTime1.shmealAtrbDate);
                  var startTimeDate2 = new Date(startTime2.shmealAtrbDate);

                  var compare = startTimeDate1 - startTimeDate2;

                  return compare;
                }.bind(this)
              );

              var dz = sortedStartTimes[0];
              var time = new Date(dz.shmealAtrbDate);
              var hh = time.getHours();
              var mm = time.getMinutes();
              if (mm < 10) {
                mm = "0" + mm;
              }

              if (hh > 12) {
                hh = hh - 12;
              }

              var gg = hh + ":" + mm;

              return gg;
            },

            endTime: function() {
              var endTimesArray = [];
              this.shmeal.shmshmealattributes.forEach(function(attribute) {
                if (attribute.attributeName === "endTime") {
                  endTimesArray.push(attribute);
                }
              });

              var sortedEndTimes = endTimesArray.sort(
                function(endTime1, endTime2) {
                  var endTimeDate1 = new Date(endTime1.shmealAtrbDate);
                  var endTimeDate2 = new Date(endTime2.shmealAtrbDate);

                  var compare = endTimeDate1 - endTimeDate2;

                  return compare;
                }.bind(this)
              );

              var dz = sortedEndTimes[0];
              var time = new Date(dz.shmealAtrbDate);
              var hh = time.getHours();
              var mm = time.getMinutes();
              var ampm = "pm";

              if (mm < 10) {
                mm = "0" + mm;
              }

              if (hh < 12) {
                ampm = "am";
              }

              if (hh > 12) {
                hh = hh - 12;
              }
              var gg = hh + ":" + mm + ampm;
              var clg = gg;
              this.clg = clg;
              return gg;
            },
            description: function() {
              var blurbsArray = [];

              this.shmeal.menuitem.shmshmealattributes.forEach(function(
                attribute
              ) {
                if (attribute.attributeName === "shmealBlurb") {
                  blurbsArray.push(attribute);
                }
              });

              var sortedBlurbs = blurbsArray.sort(
                function(blurb1, blurb2) {
                  var blurbDate1 = new Date(blurb1.attributeDate);
                  var blurbDate2 = new Date(blurb2.attributeDate);

                  var compare = blurbDate1 - blurbDate2;
                  return compare;
                }.bind(this)
              );
              return sortedBlurbs[sortedBlurbs.length - 1];
            },
            imageURL: function() {
              var imageURLsArray = [];

              this.shmeal.menuitem.shmshmealattributes.forEach(function(
                attribute
              ) {
                if (attribute.attributeName === "shmealImageURL") {
                  imageURLsArray.push(attribute);
                }
              });

              var sortedimageURLs = imageURLsArray.sort(
                function(imageURL1, imageURL2) {
                  var shmealImageURL1 = new Date(imageURL1.shmealAtrbDate);
                  var shmealImageURL2 = new Date(imageURL2.shmealAtrbDate);

                  var compare = shmealImageURL1 - shmealImageURL2;

                  return compare;
                }.bind(this)
              );

              var imageKey =
                sortedimageURLs[sortedimageURLs.length - 1].shmealAttribute;
              console.log(imageKey);

              var s3 = new AWS.S3();
              const url = s3.getSignedUrl("getObject", {
                Bucket: "kevinshmealphotos",
                Key: imageKey,
                Expires: 600
              });
              console.log(url);
              return url;
            }
          };

          updatedShmeals.push(shmealPlus);
        });
        // var awsKey = process.env.AWS_KEY;

        // console.log("key", awsKey);
        this.updatedShmeals = updatedShmeals;
      }.bind(this)
    );
  },
  mounted: function() {},

  methods: {
    setCurrentShmeal: function(inputShmeal) {
      this.currentShmeal = inputShmeal;
      this.currentShmeal.CSdescription = this.currentShmeal.description();
      this.currentShmeal.CSstartTime = this.currentShmeal.startTime();
      this.currentShmeal.CSendTime = this.currentShmeal.endTime();
      // this.clg = this.clg;
      // console.log("clg", this.clg);
      var endTimesArrayAVA = [];
      this.currentShmeal.shmeal.shmshmealattributes.forEach(function(
        attribute
      ) {
        if (attribute.attributeName === "endTime") {
          endTimesArrayAVA.push(attribute);
        }
      });

      var sortedEndTimesAVA = endTimesArrayAVA.sort(
        function(endTime1, endTime2) {
          var endTimeDate1 = new Date(endTime1.shmealAtrbDate);
          var endTimeDate2 = new Date(endTime2.shmealAtrbDate);

          var compare = endTimeDate1 - endTimeDate2;

          return compare;
        }.bind(this)
      );

      var dzE = sortedEndTimesAVA[0];
      var timeE = new Date(dzE.shmealAtrbDate);
      var hhE = timeE.getHours();
      var mmE = timeE.getMinutes();
      var ampm = "pm";

      if (mmE < 10) {
        mmE = "0" + mmE;
      }

      if (hhE < 12) {
        ampm = "am";
      }

      if (hhE > 12) {
        hhE = hhE - 12;
      }

      var startTimesArrayAVA = [];
      this.currentShmeal.shmeal.shmshmealattributes.forEach(function(
        attribute
      ) {
        if (attribute.attributeName === "startTime") {
          startTimesArrayAVA.push(attribute);
        }
      });

      var sortedStartTimesAVA = startTimesArrayAVA.sort(
        function(startTime1, startTime2) {
          var startTimeDate1 = new Date(startTime1.shmealAtrbDate);
          var startTimeDate2 = new Date(startTime2.shmealAtrbDate);

          var compare = startTimeDate1 - startTimeDate2;

          return compare;
        }.bind(this)
      );
      var dz = sortedStartTimesAVA[0];
      var time = new Date(dz.shmealAtrbDate);
      var hh = time.getHours();
      var mm = time.getMinutes();
      var timeArray = [];
      if (mm < 10) {
        mm = "0" + mm;
      }
      if (hh > 12) {
        hh = hh - 12;
      }
      timeArray.push(hh + ":" + mm);
      var index = hhE - hh;
      for (var i = 0; i < index; i++) {
        for (mm = (mm + 15 - mm % 15) % 60; mm < 60; mm = mm + 15) {
          timeArray.push(hh + ":" + mm);
        }
        hh = hh + 1;
        timeArray.push(hh + ":" + "00");
      }
      console.log("TA", hh);
      console.log("wha", this.updatedShmeals);
      console.log("data:", this.currentShmeal);
      this.timeArray = timeArray;
    },
    checkuser: function() {
      var data = {
        UserPoolId: key.pool_id,
        ClientId: key.client_id
      };
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(data);
      var cognitoUser = userPool.getCurrentUser();

      if (cognitoUser != null) {
        cognitoUser.getSession(function(err, session) {
          if (err) {
            alert(err);
            return;
          }
          console.log("session validity: " + session.isValid());
        });
      }
    }
  },

  computed: {
    availableTimes: function() {}
  }
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      selectedFile: null,
      userName: "Kevin",
      lastName: "Mercado",
      userPhoneNumber: "+17083360936",
      location: "",
      userEmail: "kmerc5187@gmail.com",
      userPassword: "K@ppa123",
      userPasswordConfirmation: "K@ppa123",
      poolData: {},
      newUser: {},
      emailVerification: "",
      phoneVerification: "",
      cognitoUser: "",
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
      var poolData = {
        UserPoolId: this.key.pool_id,
        ClientId: this.key.client_id
      };
      this.poolData = poolData;
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
    sendData: function() {
      var newUser = {
        email: this.userEmail,
        phone: this.userPhoneNumber,
        password: this.userPassword
      };
      this.newUser = newUser;
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

    verifyphone: function() {
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

      cognitoUser.confirmRegistration(this.phoneVerification, true, function(
        err,
        result
      ) {
        if (err) {
          alert(err);
          return;
        } else {
          cognitoUser.authenticateUser(authenticationDetails, {
            onSuccess: function(result) {
              var accessToken = result.getAccessToken().getJwtToken();

              /* Use the idToken for Logins Map when Federating User Pools with identity pools or when passing through an Authorization Header to an API Gateway Authorizer*/
              var idToken = result.idToken.jwtToken;
              if (cognitoUser != null) {
                cognitoUser.getSession(function(err, session) {
                  if (err) {
                    alert(err);
                    return;
                  }
                  console.log(
                    "session validity: " +
                      session.isValid() +
                      cognitoUser.username
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
                    cognitoUser.verifyAttribute(
                      "email",
                      verificationCode,
                      this
                    );
                  }
                });
              }
            },

            onFailure: function(err) {
              alert(err);
            }
          });
        }
        console.log("call result: " + result);
      });
    },

    verifyemail: function() {
      console.log("nice meme");
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
      AWS.config.update({
        accessKeyId: this.key.access_key_id,
        secretAccessKey: this.key.secret_access_key
      });
      var poolData = {
        UserPoolId: this.key.pool_id,
        ClientId: this.key.client_id
      };
      this.poolData = poolData;
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
    },

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
    }
  }
};

// var PostsNewPage = {
//   template: "#posts-new-page",
//   data: function() {
//     return {
//       title: "",
//       body: "",
//       image: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         title: this.title,
//         body: this.body,
//         image: this.image
//       };
//       axios
//         .post("/v1/posts", params)
//         .then(function(response) {
//           router.push("/");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.get("/fetchimage").then(function(response) {
      this.key = response.data;
      console.log(this.key);
      var poolData = {
        UserPoolId: this.key.pool_id,
        ClientId: this.key.client_id
      };
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

      var cognitoUser = userPool.getCurrentUser();

      if (cognitoUser != null) {
        cognitoUser.signOut();
      }
      router.push("/");
    });
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/createaccount", component: CreateAccount },
    { path: "/logout", component: LogoutPage }
    // { path: "/newpost", component: PostsNewPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = Vue.filter("formatDate", function(value) {
  if (value) {
    return moment(String(value)).format("MM/DD/YYYY hh:mm");
  }
});

new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
