import axios from 'axios';
import React, { useState } from 'react'
import { Link } from 'react-router-dom'
import baseURL from '../../api/BaseUrl';

function Register() {
    const [state, setState] = useState({ active: true });

    const handleChange = (e) => {
        let { name, value } = e.target;
        setState((pre) => ({ ...pre, [name]: value }));
    }

    const handleRegister = async (e) => {
        e.preventDefault()
        try {
            const data = await axios.post(baseURL + "staff-accounts/register", state);
            console.log(data)
            window.location.href = "/login"

        } catch (error) {

        }
    }
    return (
        <section className="section-content padding-y">
            <div className="card mx-auto" style={{ maxWidth: 520 }}>
                <article className="card-body">
                    <header className="mb-4">
                        <h4 className="card-title">Sign up</h4>
                    </header>
                    <form onSubmit={handleRegister}>
                        <div className="form-row">
                            <div className="col form-group">
                                <label>First name</label>
                                <input onChange={handleChange} type="text" name='firstName' className="form-control" placeholder="" />
                            </div>
                            <div className="col form-group">
                                <label>Last name</label>
                                <input onChange={handleChange} type="text" name='lastName' className="form-control" placeholder="" />
                            </div>
                        </div>
                        <div className="form-group">
                            <div className="form-group">
                                <label>Fullname</label>
                                <input onChange={handleChange} type="text" name='fullName' className="form-control" placeholder="" />
                            </div>
                        </div>
                        <div className="form-group">
                            <label>Email</label>
                            <input onChange={handleChange} type="email" name='email' className="form-control" placeholder="" />
                            <small className="form-text text-muted">
                                We'll never share your email with anyone else.
                            </small>
                        </div>
                        {/* <div className="form-group">
                            <label className="custom-control custom-radio custom-control-inline">
                                <input
                                    className="custom-control-input"
                                    defaultChecked=""
                                    type="radio"
                                    name="gender"
                                    defaultValue="option1"
                                />
                                <span className="custom-control-label"> Male </span>
                            </label>
                            <label className="custom-control custom-radio custom-control-inline">
                                <input
                                    className="custom-control-input"
                                    type="radio"
                                    name="gender"
                                    defaultValue="option2"
                                />
                                <span className="custom-control-label"> Female </span>
                            </label>
                        </div> */}
                        {/* <div className="form-row">
                            <div className="form-group col-md-6">
                                <label>City</label>
                                <input type="text" className="form-control" />
                            </div>
                            <div className="form-group col-md-6">
                                <label>Country</label>
                                <select id="inputState" className="form-control">
                                    <option> Choose...</option>
                                    <option>Uzbekistan</option>
                                    <option>Russia</option>
                                    <option selected="">United States</option>
                                    <option>India</option>
                                    <option>Afganistan</option>
                                </select>
                            </div>
                        </div> */}
                        <div className="form-row">
                            <div className="form-group col-md-6">
                                <label>Create password</label>
                                <input className="form-control" name='passwordHash' type="password" onChange={handleChange} />
                            </div>
                            {/* <div className="form-group col-md-6">
                                <label>Repeat password</label>
                                <input className="form-control" type="password" />
                            </div> */}
                        </div>
                        <div className="form-group">
                            <button type="submit" className="btn btn-primary btn-block">

                                Register
                            </button>
                        </div>
                        {/* <div className="form-group">
                            <label className="custom-control custom-checkbox">

                                <input
                                    type="checkbox"
                                    className="custom-control-input"
                                    defaultChecked=""
                                />
                                <div className="custom-control-label">

                                    I am agree with <a href="#">terms and contitions</a>
                                </div>
                            </label>
                        </div> */}
                    </form>
                </article>
            </div>
            <p className="text-center mt-4">
                Have an account? <Link to="/login">Log In</Link>
            </p>
            <br />
            <br />

        </section>

    )
}

export default Register
