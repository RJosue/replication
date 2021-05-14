<template>
  <div class="container-fluid">
    <div class="row no-gutter">
      <!-- The image half -->
      <div class="col-md-6 d-none d-md-flex bg-image"></div>

      <!-- The content half -->
      <div class="col-md-6 bg-light">
        <div class="login d-flex align-items-center py-5">
          <!-- Demo content-->
          <div class="container">
            <div class="row">
              <div class="col-lg-10 col-xl-7 mx-auto">
                <h3 class="display-4">Inicio de sesión</h3>
                <p class="text-muted mb-4">Proyecto de replicación</p>
                <form @submit.prevent="sendCredentials">
                  <div class="form-group mb-3">
                    <input
                      v-model="inputEmail"
                      placeholder="Email address"
                      required=""
                      autofocus=""
                      class="form-control rounded-pill border-0 shadow-sm px-4"
                    />
                  </div>
                  <div class="form-group mb-3">
                    <input
                      v-model="inputPassword"
                      type="password"
                      placeholder="Password"
                      required=""
                      class="form-control rounded-pill border-0 shadow-sm px-4 text-primary"
                    />
                  </div>
                  <div class="custom-control custom-checkbox mb-3">
                    <input
                      id="customCheck1"
                      type="checkbox"
                      checked
                      class="custom-control-input"
                    />
                    <label for="customCheck1" class="custom-control-label"
                      >Remember password</label
                    >
                  </div>
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm font-weight-bold"
                  >
                    Sign in
                  </button>
                  <div class="text-center d-flex justify-content-between mt-4">
                    <p>
                      Don´t have a account?
                      <a href="/register-user" class="font-italic text-muted">
                        <u>Create user</u></a
                      >
                    </p>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <!-- End -->
        </div>
      </div>
      <!-- End -->
    </div>
  </div>
</template>

<script>
import axios from "axios";
import Vue from "vue";
import VueSweetalert2 from "vue-sweetalert2";

// If you don't need the styles, do not connect
import "sweetalert2/dist/sweetalert2.min.css";

Vue.use(VueSweetalert2);
export default {
  data() {
    return {
      inputEmail: "",
      inputPassword: "",
    };
  },
  methods: {
    async sendCredentials() {
      let response = await axios({
        url: "/api/auth/login",
        method: "post",
        baseURL: process.env.baseURL,
        data: {
          email: this.inputEmail,
          password: this.inputPassword,
        },
      });
      if (response.data.success) {
        this.$swal({
          title: "Inicio de sessión correctamente",
          icon: "success",
        });
        document.cookie = `express:sess=${response.data.jwt}`;
        await this.$router.push("/empresa/dashboard");
      } else {
        this.$swal({
          title: "Credenciales incorrectas",
          icon: "error",
        });
      }
    },
  },
};
</script>

<style>
.login,
.image {
  min-height: 100vh;
}
.container,
.container-fluid,
.container-sm,
.container-md,
.container-lg,
.container-xl {
  /* width: 100%; */
  padding-right: 0px;
  padding-left: 0px;
  margin-right: auto;
  margin-left: auto;
}

body {
  overflow-x: clip;
}
.col-xl,
.col-xl-auto,
.col-xl-12,
.col-xl-11,
.col-xl-10,
.col-xl-9,
.col-xl-8,
.col-xl-7,
.col-xl-6,
.col-xl-5,
.col-xl-4,
.col-xl-3,
.col-xl-2,
.col-xl-1,
.col-lg,
.col-lg-auto,
.col-lg-12,
.col-lg-11,
.col-lg-10,
.col-lg-9,
.col-lg-8,
.col-lg-7,
.col-lg-6,
.col-lg-5,
.col-lg-4,
.col-lg-3,
.col-lg-2,
.col-lg-1,
.col-md,
.col-md-auto,
.col-md-12,
.col-md-11,
.col-md-10,
.col-md-9,
.col-md-8,
.col-md-7,
.col-md-6,
.col-md-5,
.col-md-4,
.col-md-3,
.col-md-2,
.col-md-1,
.col-sm,
.col-sm-auto,
.col-sm-12,
.col-sm-11,
.col-sm-10,
.col-sm-9,
.col-sm-8,
.col-sm-7,
.col-sm-6,
.col-sm-5,
.col-sm-4,
.col-sm-3,
.col-sm-2,
.col-sm-1,
.col,
.col-auto,
.col-12,
.col-11,
.col-10,
.col-9,
.col-8,
.col-7,
.col-6,
.col-5,
.col-4,
.col-3,
.col-2,
.col-1 {
  width: 100%;
  padding-block-start: 0px;
}

.bg-image {
  background-image: url("https://www.muycomputer.com/wp-content/uploads/2019/01/Genei-Sendiroo-C%C3%B3mo-enviar-art%C3%ADculos-Amazon-eBay-1000x600.jpg");
  background-size: cover;
  background-position: center center;
}
</style>
