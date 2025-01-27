import { combineReducers } from "redux";
import userReducer from "./reducer/userReducer";
import productReducer from "./reducer/productReducer";
import authReducer from "./reducer/authReducer";
import consumerDashboardReducer from "./reducer/consumerDashboardReducer";
import rfqReducer from "./reducer/rfqReducer";

const rootReducer = combineReducers({
    user: userReducer,
    product: productReducer,
    auth: authReducer,
    consumerDashboard: consumerDashboardReducer,
    rfq: rfqReducer,
})

export default rootReducer;