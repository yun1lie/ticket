import Vue from "vue";
import VueRouter from "vue-router";

import login from "@/views/login/login.vue";
import userHome from "@/views/home/userHome.vue";

Vue.use(VueRouter);

const router = new VueRouter({
  routes: [
    {
      path: "/",
      component: login,
    },
    {
      path: "/editTrain/:trainID",
      name: "editTrain",
      component: () => import("@/views/home/editTrain.vue"),
    },
    {
      path: "/deleteTrain/:trainID",
      name: "deleteTrain",
      component: () => import("@/views/home/deleteTrain.vue"),
    },
    {
      path: "/adminHome",
      component: () => import("@/views/home/adminHome.vue"),
      redirect: "/TranManagement",
      children: [
        {
          path: "/TranManagement",
          component: () => import("@/views/home/TranManagement.vue"),
        },
        {
          path: "/StationManagement",
          component: () => import("@/views/home/StationManagement.vue"),
        },
      ],
    },
    {
      path: "/userHome",
      component: userHome,
      redirect: "/viewTickets",
      children: [
        {
          path: "/purchase",
          component: () => import("@/views/home/purchase.vue"),
        },
        {
          path: "/viewTickets",
          component: () => import("@/views/home/viewTickets.vue"),
        },
      ],
    },
  ],
});
export default router;
