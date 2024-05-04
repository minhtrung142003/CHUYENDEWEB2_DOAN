import React, { useEffect, useState } from 'react'
import { addOrder, getListCart } from '../orders/OrderApi'
import { useNavigate } from 'react-router-dom';

function Payment() {
    const navigate = useNavigate();
    const [state, setState] = useState({});
    const [listProduct, setListProduct] = useState([]);
    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    const handleFormSubmit = async () => {
        try {
            const searchObj = {
                staffAccountId: currentUser?.id,

                address: state?.address,
                lastName: state?.lastName,
                userName: state?.userName,
                phone: state?.phone,
                email: state?.email,
                orderItemDto: listProduct?.map(i => ({    // thay đổi chỗ này
                    productId: i?.productDTO?.id,
                    price: i?.productDTO?.discountPrice,
                    quantity: i?.quantity
                })),
                listIdCart: listProduct?.map(i => i?.cartId),
                totalPrice: listProduct?.reduce((sum, i) => (i?.productDTO?.discountPrice * i?.quantity) + sum, 0), //thay đổi chỗ này
                totalDiscount: 0,
                createdAt: convertToMidnight(new Date()),
                deliveredCarrierAt: convertToMidnight(new Date()),
                deliveredCustomerAt: convertToMidnight(new Date()),
                approvedAt: convertToMidnight(new Date()),
            }
            const data = await addOrder(searchObj);
            if (data?.status === 200) {
               console.log(data)
               window.location.href = "/"

            }

        } catch (error) {
            console.log(error)
        }
    }

    const handleChange = (e) => {
        let { name, value } = e.target;
        setState((pre) => ({ ...pre, [name]: value }))
    }

    const getAllProduct = async () => {
        try {
            const data = await getListCart(currentUser?.id);

            setListProduct(data?.data)
        } catch (error) {

        }
    }

    useEffect(() => {
        getAllProduct();
    }, [])

    return (
        <section className="section-content padding-y">
            <div className="container" style={{ maxWidth: 720 }}>
                <div className="card mb-4">
                    <div className="card-body">
                        <h4 className="card-title mb-3">Delivery info</h4>
                        <div className="form-group">
                            <label>FullName</label>
                            <textarea name='userName' value={state?.userName} onChange={handleChange} className="form-control" rows={1} defaultValue={""} />
                        </div>
                        <div className="form-row">
                            <div className="col form-group">
                                <label>Email</label>
                                <input name="email" value={state?.email} onChange={handleChange} className="form-control" placeholder="" />
                            </div>
                            <div className="col form-group">
                                <label>Phone</label>
                                <input name="phone" value={state?.phone} onChange={handleChange} className="form-control" placeholder="" />
                            </div>
                        </div>
        
                        <div className="form-group">
                            <label>Adress</label>
                            <textarea name='address' value={state?.address} onChange={handleChange} className="form-control" rows={2} defaultValue={""} />
                        </div>

                        
                    </div>
                </div>
                <div className="card mb-4">
                    <div className="card-body">
                        <h4 className="card-title mb-4">Payment</h4>
                        <form role="form" style={{ maxWidth: 380 }}>
                            <div className="form-group">
                                <label htmlFor="lastName">Name on card</label>
                                <input
                                    type="text"
                                    className="form-control"
                                    placeholder="Ex. John Smith"
                                    required=""
                                    id='lastName'
                                    name='lastName'
                                    value={state?.lastName}
                                    onChange={handleChange}
                                />
                            </div>
                            <div className="form-group">
                                <label htmlFor="cardNumber">Card number</label>
                                <div className="input-group">
                                    <input
                                        type="text"
                                        className="form-control"
                                        name="cardNumber"
                                        placeholder=""
                                    />
                                    <div className="input-group-append">
                                        <span className="input-group-text">
                                            <i className="fab fa-cc-visa" /> &nbsp;
                                            <i className="fab fa-cc-amex" /> &nbsp;
                                            <i className="fab fa-cc-mastercard" />
                                        </span>
                                    </div>
                                </div>
                            </div>
                            {/* <div className="row">
                                <div className="col-md flex-grow-0">
                                    <div className="form-group">
                                        <label className="hidden-xs">Expiration</label>
                                        <div className="form-inline" style={{ minWidth: 220 }}>
                                            <select className="form-control" style={{ width: 100 }}>
                                                <option>MM</option>
                                                <option>01 - Janiary</option>
                                                <option>02 - February</option>
                                                <option>03 - February</option>
                                            </select>
                                            <span style={{ width: 20, textAlign: "center" }}> / </span>
                                            <select className="form-control" style={{ width: 100 }}>
                                                <option>YY</option>
                                                <option>2018</option>
                                                <option>2019</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div className="col-md-3">
                                    <div className="form-group">
                                        <label
                                            data-toggle="tooltip"
                                            title="3 digits code on back side of the card"
                                        >
                                            CVV <i className="fa fa-question-circle" />
                                        </label>
                                        <input className="form-control" required="" type="text" />
                                    </div>
                                </div>
                            </div> */}
                            <button className="subscribe btn btn-primary btn-block" type="button" onClick={handleFormSubmit}>

                                Confirm
                            </button>
                        </form>
                    </div>
                </div>
                <br />
                <br />
            </div>
        </section>

    )
}

export default Payment

function convertToMidnight(dateTimeString) {
    const dateTime = new Date(dateTimeString);

    dateTime.setHours(0);
    dateTime.setMinutes(0);
    dateTime.setSeconds(0);

    const year = dateTime.getFullYear();
    const month = ('0' + (dateTime.getMonth() + 1)).slice(-2);
    const day = ('0' + dateTime.getDate()).slice(-2);

    const newDateTimeString = `${year}-${month}-${day}T00:00:00`;

    return newDateTimeString;
}
