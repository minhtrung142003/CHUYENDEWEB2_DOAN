import axios from 'axios';
import React, { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import baseURL from '../../api/BaseUrl';

function Login() {
    const [state, setState] = useState();

    const navigate = useNavigate();
    const handleChange = (e) => {
        let { name, value } = e.target;
        setState((pre) => ({ ...pre, [name]: value }));
    }

    const handleLogin = async (e) => {
        e.preventDefault()
        try {
            const data = await axios.post(baseURL + "staff-accounts/login", state);
            localStorage.setItem("currentUser", JSON.stringify(data?.data));
            window.location.href = "/"
        } catch (error) {

        }
    }
    return (
        <>
            <section className="section-conten padding-y" style={{ minHeight: '84vh' }}>
                <div className="card mx-auto" style={{ maxWidth: '380px' }}>
                    <div className="card-body">
                        <h4 className="card-title mb-4">Sign in</h4>
                        <form onSubmit={handleLogin}>
                            <a href="#!" className="btn btn-facebook btn-block mb-2"> <i className="fab fa-facebook-f"></i> &nbsp; Sign in with Facebook</a>
                            <a href="#!" className="btn btn-google btn-block mb-4"> <i className="fab fa-google"></i> &nbsp; Sign in with Google</a>
                            <div className="form-group">
                                <input onChange={handleChange} name="email" className="form-control" placeholder="Email" type="text" />
                            </div>
                            <div className="form-group">
                                <input onChange={handleChange} name="passwordHash" className="form-control" placeholder="Password" type="password" />
                            </div>
                            <div className="form-group">
                                <input onChange={handleChange} name="fullName" className="form-control" placeholder="Fullname" type="text" />
                            </div>
                            <div className="form-group">
                                <a href="#!" className="float-right">Forgot password?</a>
                                <label className="float-left custom-control custom-checkbox"> <input type="checkbox" className="custom-control-input" defaultChecked /> <div className="custom-control-label"> Remember </div> </label>
                            </div>
                            <div className="form-group">
                                <button type="submit" className="btn btn-primary btn-block"> Login </button>
                            </div>
                        </form>
                    </div>
                </div>

                <p className="text-center mt-4">Don't have account? <Link to="/register">Sign up</Link></p>
                <br /><br />
            </section>
        </>
    );
}

export default Login;
