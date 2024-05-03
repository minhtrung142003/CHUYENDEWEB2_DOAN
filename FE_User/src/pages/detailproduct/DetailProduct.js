import React, { useEffect, useState } from "react";
import { useLocation, Link } from "react-router-dom";
import axios from "axios"; // Import Axios for making HTTP requests
import baseURL from "../../api/BaseUrl";
import "./Detail.css"; // Import your CSS file
import { addCard } from "./DetailApi";

const cardTextStyle = {
  maxWidth: "80%",
};

const DetailProduct = () => {
  const currentUser = JSON.parse(localStorage.getItem("currentUser"));
  const [product, setProduct] = useState({});
  const location = useLocation();
  const queryParams = new URLSearchParams(location.search);
  const productId = queryParams.get("productId");

  useEffect(() => {
    // Define GET_ID function to make API request
    const GET_ID = async (endpoint, id) => {
      try {
        const response = await axios.get(`${baseURL}${endpoint}/${id}`);
        return response.data;
      } catch (error) {
        console.error("Error fetching product:", error);
        throw error;
      }
    };

    // Call GET_ID to fetch product details
    GET_ID(`products`, productId)
      .then((item) => setProduct(item))
      .catch((error) => console.error("Error setting product:", error));
  }, [productId]);

  const convertDataSubmit = (value) => {
    return {
      productId: value?.id,
      quantity: value?.quantity,
      staffAccountId: currentUser?.id,
    };
  };

  const handleAddToCard = async () => {
    try {
      if (!currentUser?.id) {
        window.location.href = "/login";
        return;
      }
      if (product.quantity > 0 && currentUser?.id) {
        const data = await addCard(convertDataSubmit(product));
        window.location.href = "/orders";
      }
    } catch (e) {}
  };
  const handleChange = (e) => {
    let { name, value } = e.target;
    setProduct((pre) => ({ ...pre, [name]: value }));
  };
  return (
    <>
      <div class="flex-box">
        <div class="left">
          <div class="big-img">
            <img
              src={
                product?.galleries?.length
                  ? "http://localhost:8080/upload/" +
                    product?.galleries[0]?.imagePath
                  : ""
              }
            />
          </div>
          <div class="images">
            {product?.galleries?.map((i, d) => {
              return (
                <div class="small-img" key={d}>
                  <img
                    src={"http://localhost:8080/upload/" + i?.imagePath}
                    onclick="showImg(this.src)"
                  />
                </div>
              );
            })}
          </div>
        </div>

        <div class="right">
          {/* <div class="url">Home Product T-Shirt</div> */}
          <div class="pname">{product?.productName}</div>
          <div class="ratings">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star-half-alt"></i>
          </div>
          <div class="price">${product?.regularPrice}</div>
          <div class="size">
            <p>Size :</p>
            <div class="psize active">M</div>
            <div class="psize">L</div>
            <div class="psize">XL</div>
            <div class="psize">XXL</div>
          </div>
          <div class="quantity">
            <p>Quantity :</p>
            <input
              type="number"
              min="1"
              max="5"
              defaultValue="1"
              name="quantity"
              onChange={handleChange}
              value={product?.quantity}
            />
          </div>
          <div class="btn-box">
            <button class="cart-btn" onClick={handleAddToCard}>
              Add to Cart
            </button>
            <button class="buy-btn">Buy Now</button>
          </div>
        </div>
      </div>
    </>
  );
};
export default DetailProduct;
