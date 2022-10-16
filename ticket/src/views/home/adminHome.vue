<template>
  <div class="adminHome">
    <el-container style="height: 800px">
      <el-aside width="220px">
        <el-menu :default-openeds="['1', '2', '3']" router>
          <el-submenu index="1">
            <template slot="title"
              ><i class="el-icon-message"></i>management</template
            >
            <el-menu-item-group>
              <el-menu-item index="TranManagement" router
                >Train management</el-menu-item
              >
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="2">
            <template slot="title"
              ><i class="el-icon-house"></i>station</template
            >
            <el-menu-item index="StationManagement"
              >Station management</el-menu-item
            >
            <el-menu-item index="addStation">addStation</el-menu-item>
            <el-menu-item index="deleteStation">deleteStation</el-menu-item>
            <el-menu-item index="updateStation">updateStation</el-menu-item>
          </el-submenu>

          <el-submenu index="3">
            <template slot="title"><i class="el-icon-house"></i>lost</template>

            <el-menu-item index="viewLost">view lost</el-menu-item>
            <el-menu-item index="manageLost">lost management</el-menu-item>
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
};
</script>

<style>
.adminHome .el-header {
  background-color: rgb(20, 96, 174);
  color: #333;
  line-height: 60px;
}

.adminHome .el-aside {
  color: #333;
}
.adminHome .con {
  height: 800px;
}
</style>