import React from "react";
import Home from "../pages/Home";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import DetailProduct from "../pages/detailproduct/DetailProduct";
import Cate from "../pages/cate/Cate";
import Login from "../pages/login/Login";
import Register from "../pages/register/Register";
import Orders from "../pages/orders/Orders";
import Payment from "../pages/payment/Payment";
import History from "../pages/history/History";
function Main() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/detailproduct" element={<DetailProduct />} />
        <Route path="/cate" element={<Cate />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        <Route path="/orders" element={<Orders />} />
        <Route path="/payment" element={<Payment />} />
        <Route path="/history" element={<History />} />
      </Routes>
    </Router>
  );
}

export default Main;
