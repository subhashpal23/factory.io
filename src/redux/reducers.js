import { combineReducers } from "redux";
import userReducer from "./reducer/userReducer";
import productReducer from "./reducer/productReducer";
import authReducer from "./reducer/authReducer";
import consumerDashboardReducer from "./reducer/consumerDashboardReducer";
import rfqReducer from "./reducer/rfqReducer";
import dataRedsucer from "./reducer/dataReducer";
import assignRfqReducer from "./reducer/assignRfqReducer";
import supplierRfqReducer from "./reducer/supplierRfqReducer";
const rootReducer = combineReducers({
    user: userReducer,
    product: productReducer,
    auth: authReducer,
    consumerDashboard: consumerDashboardReducer,
    rfq: rfqReducer,
    dataSet : dataRedsucer,
    assignRfq:  assignRfqReducer,
    supplierRfq: supplierRfqReducer
})

export default rootReducer;

