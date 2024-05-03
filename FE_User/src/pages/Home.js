import React, { useEffect, useState } from "react";

import Slider from "../components/Home/Slider";
import MenuCategoryH from "../components/Home/MenuCategory/MenuCategoryH";
import NewProducts from "../components/Home/NewProducts";
import Blog from "../components/Home/Blog";
import Testimonial from "../components/Home/Testimonial";
import MenuCategoryProductV from "../components/Home/MenuCategory/MenuCategoryProductV";
import axios from "axios";
import baseURL from "../api/BaseUrl";

function Home() {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    // Gọi API để lấy danh sách category khi component được render
    axios
      .get(baseURL + `products/tag/${"New Products"}`)
      .then((response) => {
        // Xử lý dữ liệu trả về từ API
        setProducts(response.data);
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });
  }, []);
  return (
    <main>
      <Slider />
      <MenuCategoryH />
      <div className="product-container">
        <div className="container">
          <MenuCategoryProductV />
          <NewProducts products={products} />
        </div>
      </div>
      <Testimonial />
      <Blog />
    </main>
  );
}

export default Home;
