import React, { useEffect, useState } from 'react'
import { getOrders } from './HistoryApi';

function History() {

    const currentUser = JSON.parse(localStorage.getItem("currentUser"));
    const [state, setState] = useState({})
    const search = async () => {
        try {
            const data = await getOrders(currentUser?.id);
            setState((pre) => ({ ...pre, listItems: data?.data }))
        } catch (error) {

        }
    }

    useEffect(() => {
        search();
    }, [])
    return (
        <section className="section-content padding-y">
            <div className="container">
                <div className="row">
                    <main className="col-md-12">
                        {state?.listItems?.map((i, x) => {
                            return (
                                <article key={x} className="card order-item mb-4">
                                    <header className="card-header">
                                        <a href="#" className="float-right">

                                            <i className="fa fa-print" /> Print
                                        </a>
                                        <span>Order Date: {convertDatetimeFormat(i?.createdAt)}</span>
                                    </header>
                                    <div className="card-body">
                                        <div className="row">
                                            <div className="col-md-8">
                                                <h6 className="text-muted">Delivery to</h6>
                                                <p>
                                                    {i?.userName} ({i?.lastName})<br />
                                                
                                                    
                                                    Phone + {i?.phone} Email:  {i?.email} <br/>

                                                        Location: {i?.address}<br />
                                                        P.O. Box: 100123
                                                </p>
                                            </div>
                                            <div className="col-md-4">
                                                <h6 className="text-muted">Payment</h6>
                                                <span className="text-success">
                                                    <i className="fab fa-lg fa-cc-visa" />
                                                    Visa **** 4216
                                                </span>
                                                <p>
                                                TotalPrice: ${i?.totalPrice} <br />
                                                Discount: ${i?.totalDiscount} <br />
                                                    <span className="b">Total amount: ${i?.totalPrice} </span>
                                                </p>
                                            </div>
                                        </div>
                                        {/* row.// */}
                                    </div>
                                    {/* card-body .// */}
                                    <div className="table-responsive">
                                        <table className="table table-hover">
                                            <tbody>
                                                {i?.orderItemDto?.map((item, id) => {
                                                    return (
                                                        <tr key={id}>
                                                            <td width={65}>
                                                                <img src={item?.galleries?.length && `http://localhost:8080/upload/${item?.galleries[0]?.imagePath}`} className="img-xs border" />
                                                            </td>
                                                            <td>
                                                                <p className="title mb-0">{item?.productName}</p>
                                                                <var className="price text-muted">USD {item?.price}</var>
                                                            </td>
                                                            <td>

                                                                Quantity <br /> {item?.quantity}
                                                            </td>
                                                            <td width={250}>

                                                                <a href="#" className="btn btn-outline-primary">
                                                                    Track order
                                                                </a>
                                                                <div className="dropdown d-inline-block">
                                                                    <a
                                                                        href="#"
                                                                        data-toggle="dropdown"
                                                                        className="dropdown-toggle btn btn-outline-secondary"
                                                                    >
                                                                        More
                                                                    </a>
                                                                    <div className="dropdown-menu dropdown-menu-right">
                                                                        <a href="#" className="dropdown-item">
                                                                            Return
                                                                        </a>
                                                                        <a href="#" className="dropdown-item">
                                                                            Cancel order
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                                {/* dropdown.// */}
                                                            </td>
                                                        </tr>
                                                    )
                                                })}
                                            </tbody>
                                        </table>
                                    </div>
                                    {/* table-responsive .end// */}
                                </article>
                            )
                        })}
                    </main>
                    {/* col.// */}
                </div>
            </div>
            {/* container .//  */}
        </section>

    )
}

export default History
function convertDatetimeFormat(datetimeStr) {
    // Tạo một đối tượng Date từ chuỗi datetime
    var datetimeObj = new Date(datetimeStr);

    // Lấy ngày, tháng và năm từ đối tượng Date
    var day = datetimeObj.getDate();
    var month = datetimeObj.toLocaleString('default', { month: 'long' });
    var year = datetimeObj.getFullYear();

    // Tạo chuỗi mới với định dạng yêu cầu
    var formattedDatetime = day + ' ' + month + ' ' + year;

    return formattedDatetime;
}
