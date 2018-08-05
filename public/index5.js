/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Hello there,",
      shmeals: [],
      idFilter: "",
      MenuItemIDFilter: "",
      sortAttribute: "title",
      sortAscending: true,
      currentPost: {
        id: "id goes here",
        MenuitemID: "body goes here",
        image: "https://picsum.photos/200/300/?random"
      }
    };
  },
  created: function() {
    axios.get("/upcoming").then(
      function(response) {
        this.shmeals = response.data;
        console.log("shmeals:", this.shmeals);
      }.bind(this)
    );
  },
  methods: {
    // setCurrentShmeal: function(inputShmeal) {
    //   this.currentShmeal = inputShmeal;
    // },
    // isValidShmealTitle: function(inputShmeal) {
    //   return inputShmeal.title
    //     .toLowerCase()
    //     .includes(this.idFilter.toLowerCase());
    // },
    // isValidShmealBody: function(inputShmeal) {
    //   return inputShmeal.body
    //     .toLowerCase()
    //     .includes(this.MenuitemIDFilter.toLowerCase());
    // },
    // isValidPost: function(inputPost) {
    //   return (
    //     this.isValidPostTitle(inputPost) && this.isValidPostBody(inputPost)
    //   );
    // },
    // setSortAttribute: function(inputSortAttribute) {
    //   this.sortAttribute = inputSortAttribute;
    //   this.sortAscending = !this.sortAscending;
    // }
  },
  computed: {
    //   sortedPosts: function() {
    //     return this.posts.sort(
    //       function(post1, post2) {
    //         // return recipe1.chef.localeCompare(recipe2.chef);
    //         var lowerAttribute1 = post1[this.sortAttribute].toLowerCase();
    //         var lowerAttribute2 = post2[this.sortAttribute].toLowerCase();
    //         if (this.sortAscending) {
    //           return lowerAttribute1.localeCompare(lowerAttribute2);
    //         } else {
    //           return lowerAttribute2.localeCompare(lowerAttribute1);
    //         }
    //       }.bind(this)
    //     );
    //   }
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
// };

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
