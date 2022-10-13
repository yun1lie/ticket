import requests from "./request";

export const login = (data) => {
  return requests({ url: "/login", method: "post", data });
};
