//对于axios进行二次封装
import axios from "axios";
//创建 axios 实例
const requests = axios.create({
    //配置对象
    baseURL: "/api", //在所有的路径后面都加入api
    timeout: 5000,
});


//对外暴露
export default requests;