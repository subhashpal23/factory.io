import React from "react";
import { BrowserRouter as Router, Route, Routes, Link  } from 'react-router-dom';
import GlobalStyle from "./assests/styles/GlobalStyle";
import '@fontsource/roboto';
// import Home from "./components/Home";
// import About from "./components/About";
// import Users from "./components/Users";
// import Product from "./components/Product";
import Welcome from "./components/Welcome";
import CustomerLoginPage from "./components/CustomerLoginPage";
import SupplierLoginPage from "./components/SupplierLoginPage";
import RegistrationPage from "./components/Registration";
import AdminLoginPage from "./components/AdminLoginPage";
import Dashboard from "./components/Dashboard";
import DashboardContainer from "./components/DashboardContainer";
import ManufactoringProcessPage from "./components/ManufactoringProcessPage";
import SupplierProfile from "./components/SupplierProfile";

const App = () => {
    return (
        <> 
            <GlobalStyle />
            <Router>
            <Routes>
                <Route path="/" element={<Welcome />} />
                <Route path="/consumer-login" element={<CustomerLoginPage />} />
                <Route path="/admin-login" element={<AdminLoginPage />} />
                <Route path="/supplier-login" element={<SupplierLoginPage />} />
                <Route path="/supplier-registration" element={<RegistrationPage user_type = "supplier"/>} />
                <Route path="/consumer-registration" element={<RegistrationPage user_type = "consumer"/>} />
                <Route path="/dashboard" element={<DashboardContainer />} />
                <Route path="/manufactoring/:process" element={<ManufactoringProcessPage />}/>
                <Route path="/supplier-profile" element={<SupplierProfile />} />
                
                {/** Protected routes*/}
                {/* <Route path="/dashboard" element={<Dashboard user_type = "consumer"/>} /> */}
                {/* <Route path="/dashboard" element={<RoleBasedRoute element={<Dashboard />} requiredRole={UserRole.CONSUMER} />} />
                <Route path="/dashboard"element={ <RoleBasedRoute element={<Dashboard />} requiredRole={UserRole.CONSUMER} />} /> */}

            </Routes>
            {/* <header>
                <nav>
                    <ul style={{ display: "flex", listStyleType: "none", gap: "20px" }}>
                        <li>
                            <Link to="/">Home</Link>
                        </li>
                        <li>
                            <Link to="/about">About</Link>
                        </li>
                        <li>
                            <Link to="/users">Users</Link>
                        </li>
                        <li>
                            <Link to="/products">Products</Link>
                        </li>
                    </ul>
                </nav>
            </header>
            
            <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/about" element={<About />} />
                <Route path="/users" element={<Users />} />
                <Route path="/products" element={<Product />} />
            </Routes> */}
        </Router>
        </>
        
    );
}

export default App;
