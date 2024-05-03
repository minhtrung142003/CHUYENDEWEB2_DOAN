import React, { useEffect, useState } from "react";
import axios from "axios";
import baseURL from "../../api/BaseUrl";
import ImageProduct from "./ImageProduct";
import TopListProduct from "./TopListProduct";
import DealOfDayProduct from "./DealOfDayProduct";
import { IonIcon } from "@ionic/react"; // Import IonIcon từ @ionic/react
import {
  bagAddOutline,
  repeatOutline,
  eyeOutline,
  heartOutline,
  starOutline,
  star,
} from "ionicons/icons";
import { Link } from "react-router-dom";
function NewProducts({ products }) {
  return (
    <div className="product-box">
      <div className="product-minimal">
        <TopListProduct tagName={"New Arrivals"} limit={8} />
        <TopListProduct tagName={"Trending"} limit={8} />
        <TopListProduct tagName={"Top Rated"} limit={8} />
      </div>
      {/*
      - PRODUCT FEATURED
    */}
      <DealOfDayProduct />
      {/*
      - PRODUCT GRID
    */}

      <div className="product-main">
        <h2 className="title">New Products</h2>
        <div className="product-grid">
          {products.map((product) => (
            <div key={product.id} className={`showcase  id=${product.id}`}>
              <div className="showcase-banner" key={product.id}>
                <Link to={`/detailproduct?productId=${product.id}`} className="showcase-img-box">
                  <ImageProduct
                    id={product.id}
                    name={product.productName}
                    tagName={"new"}
                  />
                </Link>

                <div className="showcase-actions">
                  <button className="btn-action">
                    <IonIcon icon={heartOutline} />
                  </button>
                  <button className="btn-action">
                    <IonIcon icon={eyeOutline} />
                  </button>
                  <button className="btn-action">
                    <IonIcon icon={repeatOutline} />
                  </button>
                  <button className="btn-action">
                    <IonIcon icon={bagAddOutline} />
                  </button>
                </div>
              </div>
              <div className="showcase-content">
                <a href="#" className="showcase-category">
                  {product.categories[0].categoryName}
                </a>

                <Link to={`/detailproduct?productId=${product.id}`} className="showcase-img-box">
                  <h3 className="showcase-title">{product.productName}</h3>
                </Link>



                <div className="showcase-rating">
                  <IonIcon icon={star} />
                  <IonIcon icon={star} />
                  <IonIcon icon={star} />
                  <IonIcon icon={starOutline} />
                  <IonIcon icon={starOutline} />
                </div>
                <div className="price-box">
                  <p className="price">${product.regularPrice}.00</p>
                  <del>${product.discountPrice}.00</del>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default NewProducts;
