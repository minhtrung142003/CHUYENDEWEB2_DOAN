// SidebarSubmenuCategory.js
import React from "react";

const SidebarSubmenuCategory = ({ item, handleSearch }) => {
  return (
    <li className="sidebar-submenu-category" onClick={() => handleSearch(item)}>
      <p className="sidebar-submenu-title">
        <p className="product-name">{item.categoryName}</p>
        {/* <data value={stock} className="stock" title="Available Stock">{stock}</data> */}
      </p>
    </li>
  );
};

export default SidebarSubmenuCategory;
