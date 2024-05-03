import React, //tạo component react,
 { useEffect, useState } from "react"; //   Để quản lý các side effects và state trong component.
import coat from "../../../assets/images/icons/coat.svg";
import glasses from "../../../assets/images/icons/glasses.svg";
import shorts from "../../../assets/images/icons/shorts.svg";
import tee from "../../../assets/images/icons/tee.svg";
import jacket from "../../../assets/images/icons/jacket.svg";
import watch from "../../../assets/images/icons/watch.svg";
import hat from "../../../assets/images/icons/hat.svg";
import dress from "../../../assets/images/icons/dress.svg";
import shoes from "../../../assets/images/icons/shoes.svg";
import jewelry from "../../../assets/images/icons/jewelry.svg";
import perfume from "../../../assets/images/icons/perfume.svg";
import cosmetics from "../../../assets/images/icons/cosmetics.svg";
import bag from "../../../assets/images/icons/bag.svg";
import axios from "axios";
import baseURL from "../../../api/BaseUrl";
import { Link } from "react-router-dom";
function MenuCategoryH() {
  const [menuData, setMenuData] = useState([]); // lưu trữ dữ liệu danh mục sp

  useEffect(() => {
    // Gọi API để lấy danh sách category khi component được render
    axios
      .get(baseURL + "categories/root") // dùng method get để gửi yêu cầu đến endpoint /categories/root
      .then((response) => {
        const combinedMenuData = response.data.map((item, index) => {   // kết hợp 2 data lại vs nhau
          // Kết hợp thuộc tính từ menuData2 vào menuData dựa trên index
          return { ...item, ...menuData2[index] };
        });
        console.log(combinedMenuData);
        setMenuData(combinedMenuData);
      })
      .catch((error) => {
        console.error("Error fetching categories:", error);
      });
  }, []);

  const menuData2 = [
    {
      icon: dress,
    },
    {
      icon: shoes,
    },
    {
      icon: jewelry,
    },
    {
      icon: perfume,
    },
    {
      icon: cosmetics,
    },
    {
      icon: glasses,
    },
    {
      icon: bag,
    },
  ];

  return (
    <div className="category">
      <div className="container">
        <div className="category-item-container has-scrollbar">
          {menuData?.map((i, index) => { // tương đương với menuData && menuData.map : dùng để đảm bảo ko gây lỗi hoặc nó là null, undefined
            return (
              <div key={index} className="category-item">
                <div className="category-img-box">
                  <img src={i?.icon} alt="dress & frock" width={30} />
                </div>
                <div className="category-content-box">
                  <div className="category-content-flex">
                    <h3 className="category-item-title">{i?.categoryName}</h3>
                    {/* <p className="category-item-amount">(53)</p> */}
                  </div>
                  <Link
                    to={`/cate?cateName=${i?.categoryName}`}
                    className="category-btn"
                  >
                    Show all
                  </Link>
                </div>
              </div>
            );
          })}
          {/* <div className="category-item">
            <div className="category-img-box">
              <img src={dress} alt="dress & frock" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Dress &amp; frock</h3>
                <p className="category-item-amount">(53)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={coat} alt="winter wear" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Winter wear</h3>
                <p className="category-item-amount">(58)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={glasses} alt="glasses & lens" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Glasses &amp; lens</h3>
                <p className="category-item-amount">(68)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={shorts} alt="shorts & jeans" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Shorts &amp; jeans</h3>
                <p className="category-item-amount">(84)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={tee} alt="t-shirts" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">T-shirts</h3>
                <p className="category-item-amount">(35)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={jacket} alt="jacket" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Jacket</h3>
                <p className="category-item-amount">(16)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={watch} alt="watch" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Watch</h3>
                <p className="category-item-amount">(27)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div>
          <div className="category-item">
            <div className="category-img-box">
              <img src={hat} alt="hat & caps" width={30} />
            </div>
            <div className="category-content-box">
              <div className="category-content-flex">
                <h3 className="category-item-title">Hat &amp; caps</h3>
                <p className="category-item-amount">(39)</p>
              </div>
              <a href="#" className="category-btn">
                Show all
              </a>
            </div>
          </div> */}
        </div>
      </div>
    </div>
  );
}

export default MenuCategoryH;
