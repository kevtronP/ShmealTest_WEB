/* global Vue, VueRouter, axios, google, moment, AWS */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Hello there,",
      shmeals: [],
      shmealsWithData: [],
      idFilter: "",
      MenuItemIDFilter: "",
      sortAttribute: "attributeDate",
      sortAscending: true,
      updatedShmeals: {},
      dz: {},
      currentShmeal: {
        shmeal: {},
        CSdescription: "hello",
        CSstartTime: "",
        CSendTime: ""
      }
    };
  },
  created: function() {
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
            title: "Hello World!"
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
            }

            // imageURL: function() {
            //   AWS.config.update({
            //     accessKeyId: "Key",
            //     secretAccessKey: "sKey"
            //   });
            //   var s3 = new AWS.S3();
            //   const url = s3.getSignedUrl("getObject", {
            //     Bucket: "kevinshmealphotos",
            //     Key: "Grilled Salmon 🐟@2x.png",
            //     Expires: 600
            //   });
            //   console.log(url);
            //   return url;
            // }
          };

          updatedShmeals.push(shmealPlus);
        });

        // console.log("shmeal_start_time:", updatedShmeals[0].startTime());
        // console.log("shmeal_end_time:", updatedShmeals[0].endTime());
        // console.log(
        //   "shmeal_blurb:",
        //   updatedShmeals[0].description().shmealAttribute
        // );
        this.updatedShmeals = updatedShmeals;
        // console.log("updated_shmeals:", updatedShmeals);
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

      var index = this.currentShmeal.CSstartTime;

      console.log("data:", this.currentShmeal);
      console.log("index:", index);
    }
  },

  computed: {
    // description: function() {
    //   var blurbsArray = [];

    //   this.shmeal.menuitem.shmshmealattributes.forEach(function(attribute) {
    //     if (attribute.attributeName === "shmealBlurb") {
    //       blurbsArray.push(attribute);
    //     }
    //   });

    //   var sortedBlurbs = blurbsArray.sort(
    //     function(blurb1, blurb2) {
    //       var blurbDate1 = new Date(blurb1.attributeDate);
    //       var blurbDate2 = new Date(blurb2.attributeDate);

    //       var compare = blurbDate1 - blurbDate2;
    //       return compare;
    //     }.bind(this)
    //   );
    //   return sortedBlurbs[sortedBlurbs.length - 1];
    // },

    availableTimes: function() {}
  }
};

// var SignupPage = {
//   template: "#signup-page",
//   data: function() {
//     return {
//       name: "",
//       email: "",
//       password: "",
//       passwordConfirmation: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         name: this.name,
//         email: this.email,
//         password: this.password,
//         password_confirmation: this.passwordConfirmation
//       };
//       axios
//         .post("/v1/users", params)
//         .then(function(response) {
//           router.push("/login");
//         })
//         .catch(
//           function(error) {
//             this.errors = error.response.data.errors;
//           }.bind(this)
//         );
//     }
//   }
// };g

// var LoginPage = {
//   template: "#login-page",
//   data: function() {
//     return {
//       email: "",
//       password: "",
//       errors: []
//     };
//   },
//   methods: {
//     submit: function() {
//       var params = {
//         auth: { email: this.email, password: this.password }
//       };
//       axios
//         .post("/user_token", params)
//         .then(function(response) {
//           axios.defaults.headers.common["Authorization"] =
//             "Bearer " + response.data.jwt;
//           localStorage.setItem("jwt", response.data.jwt);
//           router.push("/");
//         })
//         .catch(
//           function(error) {
//             this.errors = ["Invalid email or password."];
//             this.email = "";
//             this.password = "";
//           }.bind(this)
//         );
//     }
//   }
// };

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

// var LogoutPage = {
//   template: "<h1>Logout</h1>",
//   created: function() {
//     axios.defaults.headers.common["Authorization"] = undefined;
//     localStorage.removeItem("jwt");
//     router.push("/");
//   }
// };

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage }
    // { path: "/signup", component: SignupPage },
    // { path: "/login", component: LoginPage },
    // { path: "/logout", component: LogoutPage },
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
