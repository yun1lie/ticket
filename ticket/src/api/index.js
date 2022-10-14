import requests from "./request";

export const login = (data) => {
  return requests({ url: "/login", method: "post", data });
};
export const viewTickets = (data) => {
  return requests({ url: "/viewTickets", method: "post", data });
};

export const getTrain = () => {
  return requests({ url: "/selectTrain", method: "get" });
};

export const buyFirst = (data) => {
  return requests({ url: "/BuyTicket", method: "post", data });
};

//删除车辆
export const deleteTrain = (data) => {
  return requests({ url: "/deleteTrain", method: "post", data });
};

//查询单个车辆信息
export const findOneTrain = (data) => {
  return requests({ url: "/finOneTrain", method: "post", data });
};

//修改车辆信息
export const updateTrain = (data) => {
  return requests({ url: "/updateTrain", method: "post", data });
};
