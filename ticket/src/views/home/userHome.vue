<template>
  <div class="userHome">
    <el-container style="height: 800px">
      <el-aside width="220px" hight="800px">
        <el-menu :default-openeds="['1', '2', '3']" router>
          <el-submenu index="1">
            <template slot="title"
              ><i class="el-icon-message"></i>ticket</template
            >
            <el-menu-item-group>
              <el-menu-item index="viewTickets" router
                >View purchased tickets</el-menu-item
              >
              <el-menu-item index="purchase">Purchase tickets</el-menu-item>
            </el-menu-item-group>
          </el-submenu>

          <el-submenu index="2">
            <template slot="title"><i class="el-icon-house"></i>lost</template>

            <el-menu-item index="vLost">view lost</el-menu-item>
            <el-menu-item index="mLost">lost management</el-menu-item>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title"
              ><i class="el-icon-ship"></i>station</template
            >
            <el-menu-item index="Scenery">station Scenery</el-menu-item>
          </el-submenu>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header style="text-align: right; font-size: 12px">
          <el-dropdown @command="comm">
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="logout">logout</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <span>{{ user.userID }}</span>
        </el-header>

        <el-main> <router-view> </router-view> </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  methods: {
    comm(command) {
      if (command == "logout") {
        sessionStorage.removeItem("token");
        this.$router.push("/");
      }
    },
  },
  created() {
    this.user = JSON.parse(sessionStorage.getItem("logUser"));
  },

  data() {
    return {};
  },
};
</script>

<style>
.userHome .el-header {
  background-color: rgb(20, 96, 174);
  color: #333;
  line-height: 60px;
}

.userHome .el-aside {
  color: #333;
}
.userHome .con {
  height: 800px;
}
</style>