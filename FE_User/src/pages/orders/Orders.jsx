import React, { useEffect, useState } from 'react'
import { delCart, getListCart, updateQuanlityOrder } from './OrderApi';
import { Link, useNavigate } from 'react-router-dom';

function Orders() {

    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    const [stateValue, setStateValue] = useState({});
    const navigate = useNavigate();

    const search = async () => {
        try {
            const data = await getListCart(currentUser?.id);
            setStateValue((pre) => ({ ...pre, listData: data?.data }))
        } catch (error) {

        }
    }

    const handleDelete = async (value) => {
        try {
            const data = await delCart(value?.cartId);
            window.location.reload()
        } catch (error) {

        }
    }

    const handlePayment = () => {
        if (!currentUser) {
            navigate("/login")
        } else {
            navigate("/payment")
        }
    }

    const handleUpdateQiantity = async (itemEdit) => {
        try {
            let searchObj = {
                staffAccountId: currentUser?.id,
                productId: itemEdit?.id
            }
            let formData = new FormData();
            formData.append("newQuantity", itemEdit?.quantity)
            const data = await updateQuanlityOrder(searchObj, formData);

            console.log(data)
        } catch (error) {
            console.log(error)

        }
    }
    const handleChangeQuantity = (rowData, value) => {
        const newList = stateValue.listData?.map(i => {
            return {
                ...i,
                quantity: i?.cartId === rowData?.cartId ? value : i.quantity
            }
        })
        let itemEdit = newList.find(i => i?.cartId === rowData?.cartId);
        handleUpdateQiantity(itemEdit)
        setStateValue((pre) => ({ ...pre, listData: newList }))
    }

    const countTotalPrice = (list = []) => {
        return list?.reduce((sum, i) => (i?.discountPrice * i?.quantity) + sum, 0)
    }

    useEffect(() => {
        search();
        window.scrollTo(0, 0)
    }, [])
    return (
        <>
            <section className="section-content padding-y">
                <div className="container">
                    <div className="row">
                        <main className="col-md-9">
                            <div className="card">
                                <table className="table table-borderless table-shopping-cart">
                                    <thead className="text-muted">
                                        <tr className="small text-uppercase">
                                            <th scope="col">Product</th>
                                            <th scope="col" width={120}>
                                                Quantity
                                            </th>
                                            <th scope="col" width={120}>
                                                Price
                                            </th>
                                            <th scope="col" className="text-right" width={200}>
                                                {" "}
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {stateValue?.listData?.map((i, x) => {
                                            console.log(i)
                                            return (

                                                <tr key={x}>
                                                    <td>
                                                        <figure className="itemside">
                                                            <div className="aside">
                                                                <img src={`http://localhost:8080/upload/${i?.galleries[0]?.imagePath}`} className="img-sm" alt= {i?.productName} />
                                                            </div>
                                                            <figcaption className="info">
                                                                <a href="#" className="title text-dark">
                                                                    {i?.productName}
                                                                </a>
                                                                <p className="text-muted small">
                                                                    Size: XL, Color: blue, <br /> Brand: Gucci
                                                                </p>
                                                            </figcaption>
                                                        </figure>
                                                    </td>
                                                    <td>
                                                        <input min="1" className="form-control" type="number" value={i?.quantity} onChange={(e) => handleChangeQuantity(i, e.target.value)} />
                                                    </td>
                                                    <td>
                                                        <div className="price-wrap">
                                                            <var className="price">${i?.discountPrice}</var>
                                                            <small className="text-muted"> $315.20 each </small>
                                                        </div>{" "}
                                                        {/* price-wrap .// */}
                                                    </td>
                                                    <td className="text-right">
                                                        <a
                                                            data-original-title="Save to Wishlist"
                                                            title=""
                                                            href=""
                                                            className="btn btn-light"
                                                            data-toggle="tooltip"
                                                        >
                                                            {" "}
                                                            <i className="fa fa-heart" />
                                                        </a>
                                                        <div href="" className="btn btn-light" onClick={() => handleDelete(i)}>
                                                            Remove
                                                        </div>
                                                    </td>
                                                </tr>
                                            )
                                        })}
                                    </tbody>
                                </table>
                                <div className="card-body border-top">
                                    {stateValue?.listData?.length > 0 && <div className="btn btn-primary float-md-right" onClick={handlePayment}>
                                        {" "}
                                        Make Purchase <i className="fa fa-chevron-right" />{" "}
                                    </div>}
                                    <Link to="/" className="btn btn-light">
                                        {" "}
                                        <i className="fa fa-chevron-left" /> Continue shopping{" "}
                                    </Link>
                                </div>
                            </div>{" "}
                            {/* card.// */}
                            <div className="alert alert-success mt-3">
                                <p className="icontext">
                                    <i className="icon text-success fa fa-truck" /> Free Delivery
                                    within 1-2 weeks
                                </p>
                            </div>
                        </main>{" "}
                        {/* col.// */}
                        <aside className="col-md-3">
                            <div className="card mb-3">
                                <div className="card-body">
                                    <form>
                                        <div className="form-group">
                                            <label>Have coupon?</label>
                                            <div className="input-group">
                                                <input
                                                    type="text"
                                                    className="form-control"
                                                    name=""
                                                    placeholder="Coupon code"
                                                />
                                                <span className="input-group-append">
                                                    <button className="btn btn-primary">Apply</button>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                </div>{" "}
                                {/* card-body.// */}
                            </div>{" "}
                            {/* card .// */}
                            <div className="card">
                                <div className="card-body">
                                    <dl className="dlist-align">
                                        <dt>Total price:</dt>
                                        <dd className="text-right">$ {countTotalPrice(stateValue?.listData)}</dd>
                                    </dl>
                                    <dl className="dlist-align">
                                        <dt>Discount:</dt>
                                        <dd className="text-right">$ 0</dd>
                                    </dl>
                                    <dl className="dlist-align">
                                        <dt>Total:</dt>
                                        <dd className="text-right  h5">
                                            <strong>$ {countTotalPrice(stateValue?.listData)}</strong>
                                        </dd>
                                    </dl>
                                    <hr />
                                    <p className="text-center mb-3">
                                        <img src={require("../../assets/images/payment.png")} height={26} />
                                    </p>
                                </div>{" "}
                                {/* card-body.// */}
                            </div>{" "}
                            {/* card .// */}
                        </aside>{" "}
                        {/* col.// */}
                    </div>
                </div>{" "}
                {/* container .//  */}
            </section>
            {/* ========================= SECTION CONTENT END// ========================= */}
            {/* ========================= SECTION  ========================= */}
            <section className="section-name border-top padding-y">
                <div className="container">
                    <h6>Payment and refund policy</h6>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit anim id est laborum.
                    </p>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                        veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                        commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
                        velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
                        occaecat cupidatat non proident, sunt in culpa qui officia deserunt
                        mollit anim id est laborum.
                    </p>
                </div>
                {/* container // */}
            </section>
        </>

    )
}

export default Orders
