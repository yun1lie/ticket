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
      path: "/adminHome",
      component: () => import("@/views/home/adminHome.vue"),
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
