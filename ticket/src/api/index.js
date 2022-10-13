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
