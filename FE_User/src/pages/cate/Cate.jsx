import React, { useEffect, useState } from 'react';
import "./css/bootstrap.css"
import "./css/bootstrap.css.map"
import "./css/responsive.css"
import "./css/ui.css"
import "./css/ui.css.map"
import { Link, useLocation } from 'react-router-dom';
import { searchByCateName } from './CateApi';

function Cate() {
    // location và queryParams: Lấy thông tin về URL hiện tại và tham số truy vấn.
    const location = useLocation();
    const queryParams = new URLSearchParams(location.search); 
    // lấy từ bên chỗ trang home phần Link URL
    const cateName = queryParams.get("cateName");

    const [state, setState] = useState({
        listItems: [], // lưu trữ danh sách sp
        currentPage: 1 // trang hiện tại và tổng trang
    })

   
    const [totalPages, setTotalPages] = useState(0);  // totalPages: Lưu trữ tổng số trang
    const ITEMS_PER_PAGE = 2; //  Số lượng sản phẩm hiển thị trên mỗi trang.

    const handleSearch = async () => { // gọi api để search sp theo cate và cập nhật lại State với kq tìm kiếm
        try {
            const data = await searchByCateName(cateName);
            setState((pre) => ({ ...pre, listItems: data?.data, currentPage: 1 }))
            setTotalPages(Math.ceil(data?.data.length / ITEMS_PER_PAGE));
        } catch (error) {

        }
    }
// Đây là phân trang
    const handlePageChange = (pageNumber) => { // xử lý khi user chuyển trang
        setState((prev) => ({
            ...prev,
            currentPage: pageNumber
        }));
    };
    const getCurrentPageItems = () => {  // lấy danh sách sp của trang hiện tại
        const startIndex = (state.currentPage - 1) * ITEMS_PER_PAGE;
        const endIndex = startIndex + ITEMS_PER_PAGE;
        return state.listItems.slice(startIndex, endIndex);
    };

// Phân trang ở trên 

    // Kiểm tra có thể chuyển đến trang trước đó
    const canGoPrevious = state.currentPage > 1;
    // Kiểm tra có thể chuyển đến trang tiếp theo
    const canGoNext = state.currentPage < totalPages;

    useEffect(() => { // gọi hàm handleSearch khi cateName change or component được render first
        handleSearch();
        window.scrollTo(0, 0)
    }, [cateName]);

    const handleCheckProduct = (rowData, e) => { // xử lý 
        // console.log(rowData)
        console.log(e.target.checked)
        rowData.isChose = e.target.checked;
    }

    return (
        <>
            <section class="section-content padding-y">
                <div class="container">



                    <div class="card mb-3">
                        <div class="card-body">
                            <ol class="breadcrumb float-left">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item">{cateName || ""}</li>
                                <li class="breadcrumb-item active">Item details</li>
                            </ol>
                        </div>
                    </div>



                    <div class="row">
                        <aside class="col-md-2">

                            <article class="filter-group">
                                <h6 class="title">
                                    <a href="#" class="dropdown-toggle" data-toggle="collapse" data-target="#collapse_1">	 Product type </a>
                                </h6>
                                <div class="filter-content collapse show" id="collapse_1">
                                    <div class="inner">
                                        <ul class="list-menu">
                                            <li><a href="#">Shorts  </a></li>
                                            <li><a href="#">Trousers </a></li>
                                            <li><a href="#">Sweaters  </a></li>
                                            <li><a href="#">Clothes  </a></li>
                                            <li><a href="#">Home items </a></li>
                                            <li><a href="#">Jackats</a></li>
                                            <li><a href="#">Somethings </a></li>
                                        </ul>
                                    </div>
                                </div>
                            </article>
                            <article class="filter-group">
                                <h6 class="title">
                                    <a href="#" class="dropdown-toggle" data-toggle="collapse" data-target="#collapse_2"> Brands </a>
                                </h6>
                                <div class="filter-content collapse show" id="collapse_2">
                                    <div class="inner">
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" checked="" class="custom-control-input" />
                                            <div class="custom-control-label">Adidas
                                                <b class="badge badge-pill badge-light float-right">120</b>  </div>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" checked="" class="custom-control-input" />
                                            <div class="custom-control-label">Nike
                                                <b class="badge badge-pill badge-light float-right">15</b>  </div>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" checked="" class="custom-control-input" />
                                            <div class="custom-control-label">The Noth Face
                                                <b class="badge badge-pill badge-light float-right">35</b> </div>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" checked="" class="custom-control-input" />
                                            <div class="custom-control-label">The cat
                                                <b class="badge badge-pill badge-light float-right">89</b> </div>
                                        </label>
                                        <label class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" />
                                            <div class="custom-control-label">Honda
                                                <b class="badge badge-pill badge-light float-right">30</b>  </div>
                                        </label>
                                    </div>
                                </div>
                            </article>
                            <article class="filter-group">
                                <h6 class="title">
                                    <a href="#" class="dropdown-toggle" data-toggle="collapse" data-target="#collapse_3"> Price range </a>
                                </h6>
                                <div class="filter-content collapse show" id="collapse_3">
                                    <div class="inner">
                                        <input type="range" class="custom-range" min="0" max="100" name="" />
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label>Min</label>
                                                <input class="form-control" placeholder="$0" type="number" />
                                            </div>
                                            <div class="form-group text-right col-md-6">
                                                <label>Max</label>
                                                <input class="form-control" placeholder="$1,0000" type="number" />
                                            </div>
                                        </div>
                                        <button class="btn btn-block btn-primary">Apply</button>
                                    </div>
                                </div>
                            </article>
                            <article class="filter-group">
                                <h6 class="title">
                                    <a href="#" class="dropdown-toggle" data-toggle="collapse" data-target="#collapse_4"> Sizes </a>
                                </h6>
                                <div class="filter-content collapse show" id="collapse_4">
                                    <div class="inner">
                                        <label class="checkbox-btn">
                                            <input type="checkbox" />
                                            <span class="btn btn-light"> XS </span>
                                        </label>

                                        <label class="checkbox-btn">
                                            <input type="checkbox" />
                                            <span class="btn btn-light"> SM </span>
                                        </label>

                                        <label class="checkbox-btn">
                                            <input type="checkbox" />
                                            <span class="btn btn-light"> LG </span>
                                        </label>

                                        <label class="checkbox-btn">
                                            <input type="checkbox" />
                                            <span class="btn btn-light"> XXL </span>
                                        </label>
                                    </div>
                                </div>
                            </article>
                            <article class="filter-group">
                                <h6 class="title">
                                    <a href="#" class="dropdown-toggle" data-toggle="collapse" data-target="#collapse_5"> Condition </a>
                                </h6>
                                <div class="filter-content collapse show" id="collapse_5">
                                    <div class="inner">
                                        <label class="custom-control custom-radio">
                                            <input type="radio" name="myfilter_radio" checked="" class="custom-control-input" />
                                            <div class="custom-control-label">Any condition</div>
                                        </label>

                                        <label class="custom-control custom-radio">
                                            <input type="radio" name="myfilter_radio" class="custom-control-input" />
                                            <div class="custom-control-label">Brand new </div>
                                        </label>

                                        <label class="custom-control custom-radio">
                                            <input type="radio" name="myfilter_radio" class="custom-control-input" />
                                            <div class="custom-control-label">Used items</div>
                                        </label>

                                        <label class="custom-control custom-radio">
                                            <input type="radio" name="myfilter_radio" class="custom-control-input" />
                                            <div class="custom-control-label">Very old</div>
                                        </label>
                                    </div>
                                </div>
                            </article>

                        </aside>
                        <main class="col-md-10">


                            <header class="mb-3">
                                <div class="form-inline">
                                    <strong class="mr-md-auto">{state?.listItems?.length} Items found </strong>
                                    <select class="mr-2 form-control">
                                        <option>Latest items</option>
                                        <option>Trending</option>
                                        <option>Most Popular</option>
                                        <option>Cheapest</option>
                                    </select>
                                    <div class="btn-group">
                                        <a href="page-listing-grid.html" class="btn btn-light" data-toggle="tooltip" title="List view">
                                            <i class="fa fa-bars"></i></a>
                                        <a href="page-listing-large.html" class="btn btn-light active" data-toggle="tooltip" title="Grid view">
                                            <i class="fa fa-th"></i></a>
                                    </div>
                                </div>
                            </header>

                            <div style={{ minHeight: 550 }}>
                                {getCurrentPageItems()?.map((i, index) => {
                                    return (

                                        <article class="card card-product-list" key={index}>
                                            <div class="row no-gutters">
                                                <aside class="col-md-3">
                                                    <Link to={`/detailproduct?productId=${i.id}`} class="img-wrap">
                                                        <span class="badge badge-danger"> NEW </span>
                                                        <img src={
                                                            i?.galleries[0]?.imagePath
                                                                ? "http://localhost:8080/upload/" +
                                                                i?.galleries[0]?.imagePath
                                                                : ""
                                                        } />
                                                    </Link>
                                                </aside>
                                                <div class="col-md-6">
                                                    <div class="info-main">
                                                        <Link to={`/detailproduct?productId=${i.id}`} class="h5 title">{i?.productName}</Link>
                                                        <div class="rating-wrap mb-2">
                                                            <ul class="rating-stars">
                                                                <li style={{ width: "100%" }} class="stars-active">
                                                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                                <li>
                                                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </li>
                                                            </ul>
                                                            <div class="label-rating">9/10</div>
                                                        </div>

                                                        <p class="mb-3">
                                                            {i?.tags?.map((item, id) => {
                                                                return (
                                                                    <span class="tag" key={id}> {item?.name} </span>
                                                                )
                                                            })}
                                                        </p>

                                                        <p> {i?.productDescription} </p>

                                                    </div>
                                                </div>
                                                <aside class="col-sm-3">
                                                    <div class="info-aside">
                                                        <div class="price-wrap">
                                                            <span class="h5 price">${i?.regularPrice}</span>
                                                            <small class="text-muted">/per item</small>
                                                        </div>
                                                        <small class="text-warning">Paid shipping</small>

                                                        <p class="text-muted mt-3">Grand textile Co</p>
                                                        <p class="mt-3">
                                                            <a href="#" class="btn btn-outline-primary"> <i class="fa fa-envelope"></i> Contact supplier </a>
                                                            <a href="#" class="btn btn-light"><i class="fa fa-heart"></i> Save </a>
                                                        </p>

                                                        <label class="custom-control mt-3 custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" onChange={(e) => handleCheckProduct(i, e)} />
                                                            <div class="custom-control-label">Add to compare
                                                            </div>
                                                        </label>

                                                    </div>
                                                </aside>
                                            </div>
                                        </article>
                                    )
                                })}
                            </div>
                            <nav class="mb-4" aria-label="Page navigation sample">
                                <ul class="pagination">
                                    <li className={`page-item ${!canGoPrevious ? 'disabled' : ''}`} onClick={() => canGoPrevious && handlePageChange(state.currentPage - 1)}><div class="page-link">Previous</div></li>
                                    {[...Array(totalPages).keys()].map((pageNumber) => (
                                        <li
                                            key={pageNumber}
                                            className={`page-item ${pageNumber + 1 === state.currentPage ? 'active' : ''}`}
                                            onClick={() => handlePageChange(pageNumber + 1)}
                                        >
                                            <button className="page-link">{pageNumber + 1}</button>
                                        </li>
                                    ))}
                                    <li className={`page-item ${!canGoNext ? 'disabled' : ''}`} onClick={() => canGoNext && handlePageChange(state.currentPage + 1)}><div class="page-link">Next</div></li>
                                </ul>
                            </nav>


                            <div class="box text-center">
                                <p>Did you find what you were looking for？</p>
                                <a href="" class="btn btn-light">Yes</a>
                                <a href="" class="btn btn-light">No</a>
                            </div>


                        </main>

                    </div>

                </div>
            </section>




            <section class="padding-y-lg bg-light border-top">
                <div class="container">

                    <p class="pb-2 text-center">Delivering the latest product trends and industry news straight to your inbox</p>

                    <div class="row justify-content-md-center">
                        <div class="col-lg-4 col-sm-6">
                            <form class="form-row">
                                <div class="col-8">
                                    <input class="form-control" placeholder="Your Email" type="email" />
                                </div>
                                <div class="col-4">
                                    <button type="submit" class="btn btn-block btn-warning"> <i class="fa fa-envelope"></i> Subscribe </button>
                                </div>
                            </form>
                            <small class="form-text">We’ll never share your email address with a third-party. </small>
                        </div>
                    </div>


                </div>
            </section></>
    )
}

export default Cate
