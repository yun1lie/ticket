<template>
  <div class="userHome">
    <el-container style="height:1080px border: 1px solid #eee">
      <el-aside width="220px" style="background-color: rgb(128, 159, 255)">
        <el-menu :default-openeds="['1', '3']">
          <el-submenu index="1">
            <template slot="title"
              ><i class="el-icon-message"></i>ticket</template
            >
            <el-menu-item-group>
              <el-menu-item index="1-1">View purchased tickets</el-menu-item>
              <el-menu-item index="1-2">Purchase tickets</el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>

      <el-container>
        <el-header style="text-align: right; font-size: 12px">
          <el-dropdown>
            <i class="el-icon-setting" style="margin-right: 15px"></i>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item>logout</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
          <span>王小虎</span>
        </el-header>

        <el-main> </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
export default {
  data() {},
};
</script>

<style>
.userHome .el-header {
  background-color: rgb(128, 159, 255);
  color: #333;
  line-height: 60px;
}

.userHome .el-aside {
  color: #333;
}
</style>