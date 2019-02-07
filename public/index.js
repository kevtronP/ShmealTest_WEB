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
      currentTime: {},
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
    axios.get("/upcoming").then(
      function(response) {
        this.shmeals = response.data;
        UpcomingManager.shmeal = response.data;
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

              var s3 = new AWS.S3();
              const url = s3.getSignedUrl("getObject", {
                Bucket: "kevinshmealphotos",
                Key: imageKey,
                Expires: 600
              });
              return url;
            },
            userPhoto: function() {
              var imageURLsArray = [];

              this.shmeal.menuitem.user.shmuserattributes.forEach(function(
                attribute
              ) {
                if (attribute.attributeName === "profPicURL") {
                  imageURLsArray.push(attribute);
                }
              });

              var sortedimageURLs = imageURLsArray.sort(
                function(imageURL1, imageURL2) {
                  var shmealImageURL1 = new Date(imageURL1.attributeDate);
                  var shmealImageURL2 = new Date(imageURL2.attributeDate);

                  var compare = shmealImageURL1 - shmealImageURL2;

                  return compare;
                }.bind(this)
              );
              var imageKey =
                sortedimageURLs[sortedimageURLs.length - 1].userAttribute;

              var s3 = new AWS.S3();
              const url = s3.getSignedUrl("getObject", {
                Bucket: "kevinshmealphotos",
                Key: imageKey,
                Expires: 600
              });
              return url;
            }
          };

          updatedShmeals.push(shmealPlus);
        });
        var userlocation = {};
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
          handleLocationError(false, infoWindow);
        }
        console.log(UpcomingManager.shmeal);

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
      this.timeArray = timeArray;
    },
    setCurrentTime: function(inputTime) {
      this.currentTime = inputTime;
    },
    submitOrder: function() {
      var order = {
        orderDay: new Date(),
        orderTime: this.currentTime,
        eaterID: ProfileManager.currentUser.id,
        cookID: this.currentShmeal.shmeal.menuitem.userID,
        shmealID: this.currentShmeal.shmeal.id
      };

      var orderAttribute = {
        attributeName: "pickUpTime",
        requestDateAtrb: this.currentTime,
        attributeDate: new Date(),
        requestID: null
      };

      var orderStatus = {
        statusCode: "P",
        requestID: null,
        statusStartDate: this.currentTime
      };

      axios.post("shmorders", order).then(function(response) {
        orderAttribute.requestID = response.data.id;
        orderStatus.requestID = response.data.id;
        axios.post("shmrequestattributes", orderAttribute).then(function() {
          orderAttribute.attributeName = "requestQuantity";
          orderAttribute.requestDateAtrb = null;
          orderAttribute.requestAttribute = 1;
          axios.post("shmrequestattributes", orderAttribute).then(function() {
            orderAttribute.attributeName = "specialRequest";
            orderAttribute.requestAttribute = null;
            axios.post("shmrequestattributes", orderAttribute).then(function() {
              axios.post("shmrequeststatuses", orderStatus);
            });
          });
        });
      });
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
          console.log(cognitoUser);
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
      userName: "",
      lastName: "",
      userPhoneNumber: "",
      location: "",
      userEmail: "",
      userPassword: "",
      userPasswordConfirmation: "",
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

  methods: {
    sendData: function() {
      ProfileManager.userEmail = this.userEmail;
      ProfileManager.userPhoneNumber = this.userPhoneNumber;
      ProfileManager.userPassword = this.userPassword;
      var CognitoUserPool = AmazonCognitoIdentity.CognitoUserPool;
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

      var attributeList = [];

      var dataEmail = {
        Name: "email",
        Value: this.userEmail
      };
      var dataPhoneNumber = {
        Name: "phone_number",
        Value: this.userPhoneNumber
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
        this.userPassword,
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
        Username: ProfileManager.userEmail,
        Password: ProfileManager.userPassword
      };
      var authenticationDetails = new AmazonCognitoIdentity.AuthenticationDetails(
        authenticationData
      );
      var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
      var userData = {
        Username: ProfileManager.userEmail,
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
                    router.push("/createaccount");
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
          cognitoUser.getUserAttributes(function(err, result) {
            if (err) {
              alert(err);
              return;
            }
            for (var i = 0; i < result.length; i++) {
              console.log(
                "attribute " +
                  result[i].getName() +
                  " has value " +
                  result[i].getValue()
              );
            }
            axios
              .get("/login/" + result[4].getValue())
              .then(function(response) {
                ProfileManager.currentUser = response.data[0];
                console.log(ProfileManager.currentUser);
              });
          });
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
      userName: "",
      lastName: "",
      location: "",
      poolData: {},
      retro: {},
      fresco: {},
      newUser: {},
      emailVerification: "",
      phoneVerification: "",
      cognitoUser: "",
      errors: []
    };
  },

  methods: {
    submit: function() {
      var s3 = new AWS.S3({
        params: { Bucket: "kevinshmealphotos" }
      });

      console.log(this.selectedFile);

      s3.upload(
        {
          Key: this.userEmail + ".png",
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

      ProfileManager.userName = this.userName;
      ProfileManager.lastName = this.lastName;

      var user = {
        userName: ProfileManager.userName,
        lastName: ProfileManager.lastName,
        userPhoneNumber: ProfileManager.userPhoneNumber,
        userEmail: ProfileManager.userEmail,
        userDate: new Date()
      };

      axios
        .post("users", user)

        .then(function(response) {
          this.userid = response.data;
          ProfileManager.currentUser = response.data;
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
              userAttribute: user.userEmail + ".png",
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
    },

    onFileSelected: function(event) {
      this.selectedFile = event.target.files[0];
      document.getElementById("preview").src = window.URL.createObjectURL(
        this.selectedFile
      );
    }
  }
};

var NewShmealPage = {
  template: "#new-shmeal-page",
  data: function() {
    return {
      mealName: "",
      shmealBlurb: "",
      shmealDayDate: "",
      shmealStartTime: "",
      shmealEndTime: "",
      shmealAllergen: "",
      image: "",
      errors: []
    };
  },
  methods: {
    onFileSelected: function(event) {
      this.selectedFile = event.target.files[0];
      document.getElementById("preview").src = window.URL.createObjectURL(
        this.selectedFile
      );
    },

    submitmenuitem: function() {
      console.log(this.selectedFile);
      var s3 = new AWS.S3({
        params: { Bucket: "kevinshmealphotos" }
      });

      s3.upload(
        {
          Key: this.mealName + ".png",
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
      var newShmeal = {
        mealName: this.mealName,
        shmealDayDate: this.shmealDayDate,
        shmealStartTime: this.shmealStartTime,
        shmealEndTime: this.shmealEndTime,
        shmealBlurb: this.shmealBlurb
      };

      var menuitem = {
        menuitem: {
          mealName: this.mealName,
          userID: ProfileManager.currentUser.id
        }
      };
      axios
        .post("menuitems", menuitem)
        .then(function(response) {
          console.log(response.data);
          var shmeal = {
            shmeal: {
              shmealDayDate: newShmeal.shmealDayDate,
              menuItemID: response.data.id
            }
          };
          axios
            .post("shmeals", shmeal)
            .then(function(info) {
              this.shmeal = info.data;
              console.log(info.data);
              var shmshmealattribute = {
                shmshmealattribute: {
                  attributeName: "startTime",
                  shmealAtrbDate: newShmeal.shmealStartTime,
                  attributeDate: new Date(),
                  shmealID: this.shmeal.id,
                  menuItemID: this.shmeal.menuItemID
                }
              };
              axios.post("shmshmealattributes", shmshmealattribute);
            })
            .then(function() {
              var shmshmealattribute = {
                shmshmealattribute: {
                  attributeName: "endTime",
                  shmealAtrbDate: newShmeal.shmealEndTime,
                  attributeDate: new Date(),
                  shmealID: this.shmeal.id,
                  menuItemID: this.shmeal.menuItemID
                }
              };
              axios.post("shmshmealattributes", shmshmealattribute);
            })
            .then(function() {
              var shmshmealattribute = {
                shmshmealattribute: {
                  attributeName: "shmealBlurb",
                  shmealAttribute: newShmeal.shmealBlurb,
                  attributeDate: new Date(),
                  shmealID: this.shmeal.id,
                  menuItemID: this.shmeal.menuItemID
                }
              };
              axios.post("shmshmealattributes", shmshmealattribute);
            })
            .then(function() {
              var shmshmealattribute = {
                shmshmealattribute: {
                  attributeName: "shmealImageURL",
                  shmealAttribute: newShmeal.mealName + ".png",
                  attributeDate: new Date(),
                  shmealID: this.shmeal.id,
                  menuItemID: this.shmeal.menuItemID
                }
              };
              axios.post("shmshmealattributes", shmshmealattribute);
            });
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "#LogoutPage",
  created: function() {
    var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);

    var cognitoUser = userPool.getCurrentUser();

    if (cognitoUser != null) {
      cognitoUser.signOut();
    }
    router.push("/");
  }
};

var UpcomingShmealPage = {
  template: "#upcoming-shmeal-page",
  data: function() {
    return {
      activeShmeals: {},
      events: [],
      sortAttribute: "id",
      sortAscending: true,
      message: "TEST"
    };
  },
  created: function() {
    this.activeShmeals = UpcomingManager.shmeal;
    console.log(this.activeShmeals);
    console.log(UpcomingManager);
  },
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/createaccount", component: CreateAccount },
    { path: "/logout", component: LogoutPage },
    { path: "/newshmeal", component: NewShmealPage },
    { path: "/upcomingshmeal", component: UpcomingShmealPage }
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

var ProfileManager = {
  userName: "",
  lastName: "",
  userPhoneNumber: "",
  userEmail: "",
  userPassword: "",
  currentUser: {}
};

var UpcomingManager = {
};

new Vue({
  el: "#vue-app",
  router: router,
  data: function() {
    return {
      message: "Burn to cinder",
      ProfileManager: {
        currentUser: {}
      },
      UpcomingManager: {
        shmeal: {}
      },
      errors: []
    };
  },
  created: function() {
    axios.get("/upcoming").then(function(response) {
      UpcomingManager.shmeal = response.data;
    }).then(function() {
      axios.get("/fetchimage").then(function(response) {
        this.key = response.data;
        AWS.config.update({
          accessKeyId: this.key.access_key_id,
          secretAccessKey: this.key.secret_access_key
        });
        var poolData = {
          UserPoolId: this.key.pool_id,
          ClientId: this.key.client_id
        };
        this.poolData = poolData;
        var userPool = new AmazonCognitoIdentity.CognitoUserPool(poolData);
        var cognitoUser = userPool.getCurrentUser();
        cognitoUser.getSession(function(err, session) {
          if (err) {
            alert(err);
            return;
          }

          cognitoUser.getUserAttributes(function(err, result) {
            if (err) {
              // error so send to log in page
              alert(err);
              return;
            }
            for (var i = 0; i < result.length; i++) {
              if (result[i].getName() === "email") {
                axios
                  .get("/login/" + result[i].getValue())
                  .then(function(response) {
                    ProfileManager.currentUser = response.data[0];
                  });
              }
              console.log(
                "attribute " +
                  result[i].getName() +
                  " has value " +
                  result[i].getValue()
              );
            }
          });
        });
      });
    });
    this.ProfileManager = ProfileManager;
  },
  methods: {
    userPhoto: function() {
      var s3 = new AWS.S3();
      var imageURLsArray = [];

      ProfileManager.currentUser.shmuserattributes.forEach(function(attribute) {
        if (attribute.attributeName === "profPicURL") {
          imageURLsArray.push(attribute);
        }
      });

      var sortedimageURLs = imageURLsArray.sort(
        function(imageURL1, imageURL2) {
          var shmealImageURL1 = new Date(imageURL1.attributeDate);
          var shmealImageURL2 = new Date(imageURL2.attributeDate);

          var compare = shmealImageURL1 - shmealImageURL2;

          return compare;
        }.bind(this)
      );
      var imageKey = sortedimageURLs[sortedimageURLs.length - 1].userAttribute;

      const url = s3.getSignedUrl("getObject", {
        Bucket: "kevinshmealphotos",
        Key: imageKey,
        Expires: 600
      });
      return url;
    }
  }
});
