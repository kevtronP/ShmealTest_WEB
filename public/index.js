/* global Vue, VueRouter, axios, google */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Hello there,",
      shmeals: [],
      idFilter: "",
      MenuItemIDFilter: "",
      sortAttribute: "attributeDate",
      sortAscending: true,
      currentShmeal: {
        menuitem: {
          shmshmealattributes: [],
          user: {}
        },
        shmeal: {},
        description: "hello"
      }
    };
  },
  created: function() {
    axios.get("/upcoming").then(
      function(response) {
        this.shmeals = response.data;

        var shmealLATLNG = {
          lat: this.shmeals[0].menuitem.user.shmuserattributes[0].userAttribute,
          lng: this.shmeals[0].menuitem.user.shmuserattributes[1].userAttribute
        };
        console.log(shmealLATLNG);

        var locations = [];

        var map = new google.maps.Map(document.getElementById("map"), {
          zoom: 8,
          center: new google.maps.LatLng(41.9, -87.65)
        });

        var i = 1;
        var n = 1;

        this.shmeals.forEach(function(shmeal) {
          var lat = [];
          var lng = [];

          // console.log("shmeal " + i, shmeal);
          // console.log(shmeal.menuitem.user.shmuserattributes);
          shmeal.menuitem.user.shmuserattributes.forEach(function(attribute) {
            if (attribute.attributeName === "userHomeLat") {
              lat.push(attribute.userAttribute);
            } else if (attribute.attributeName === "userHomeLon") {
              lng.push(attribute.userAttribute);
            }
          });
          i++;

          // console.log(lat);
          // console.log(lng);
          var infowindow = new google.maps.InfoWindow();
          var marker = new google.maps.Marker({
            position: {
              lat: Number(lat[0]),
              lng: Number(lng[0])
            },
            title: "Hello World!"
          });
          marker.setMap(map);
        });

        // for (i = 0; i < locations.length; i++) {
        //   marker = new google.maps.Marker({
        //     position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        //     map: map
        //   });

        //   google.maps.event.addListener(
        //     marker,
        //     "click",
        //     (function(marker, i) {
        //       return function() {
        //         infowindow.setContent(locations[i][0]);
        //         infowindow.open(map, marker);
        //       };
        //     })(marker, i)
        //   );
        // }
        console.log("shmeals:", this.shmeals);
      }.bind(this)
    );
  },
  mounted: function() {},

  methods: {
    setCurrentShmeal: function(inputShmeal) {
      this.currentShmeal = inputShmeal;

      console.log(this.sortedShmealBlurbAttributes);
      this.currentShmeal.description = this.sortedShmealBlurbAttributes[
        this.sortedShmealBlurbAttributes.length - 1
      ].shmealAttribute;
    }
  },
  computed: {
    sortedShmealBlurbAttributes: function() {
      var blurbsArray = [];

      this.currentShmeal.menuitem.shmshmealattributes.forEach(function(
        attribute
      ) {
        if (attribute.attributeName === "shmealBlurb") {
          blurbsArray.push(attribute);
          // this.currentShmeal.description = attribute.shmealAttribute;
        }
      });

      return blurbsArray.sort(
        function(blurb1, blurb2) {
          var blurbDate1 = new Date(blurb1.attributeDate);
          var blurbDate2 = new Date(blurb2.attributeDate);

          var compare = blurbDate1 - blurbDate2;

          return compare;
        }.bind(this)
      );
    },

    sortedShmealStartTimeAttributes: function() {
      var startTimesArray = [];

      this.currentShmeal.shmshmealattributes.forEach(function(attribute) {
        if (attribute.attributeName === "startTime") {
          startTimesArray.push(attribute);
          // this.currentShmeal.description = attribute.shmealAttribute;
        }
      });

      return startTimesArray.sort(
        function(startTime1, startTime2) {
          var startTimeDate1 = new Date(startTime1.attributeDate);
          var startTimeDate2 = new Date(startTime2.attributeDate);

          var compare = startTimeDate1 - startTimeDate2;

          return compare;
        }.bind(this)
      );
    }
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

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});
