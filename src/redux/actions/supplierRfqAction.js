//import { notification } from 'antd'
import { showErrorNotification, showSuccessNotification } from "../../utils/AppNotification";
export const getSupplierRfqReceivedList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_RFQ_LIST_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getSupplierRFQList', {
                method: 'GET', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'GET_SUPPLIER_RFQ_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_RFQ_LIST_FAILURE', payload: error.message });
        }
    };
}

export const getSupplierRfqRejectedList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_RFQ_REJECTED_LIST_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getSupplierRejectedRFQList', {
                method: 'GET', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'GET_SUPPLIER_RFQ_REJECTED_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_RFQ_REJECTED_LIST_FAILURE', payload: error.message });
        }
    };
}


export const getSupplierQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/allQuotationListForSupplier', {
                method: 'GET', 
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` 
                },
                // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'GET_SUPPLIER_QUOTE_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_QUOTE_LIST_FAILURE', payload: error.message });
        }
    };
}


export const changeRfqStatus = (token,requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'CHANGE_RFQ_STATUS_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/changeRFQStatus', {
                method: 'POST', // Specify the HTTP method
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}`

                },
                body: JSON.stringify(requestRfqStatus), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            if(data && data?.status) {
                showSuccessNotification(data.message)
            }
            dispatch({ type: 'CHANGE_RFQ_STATUS_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'CHANGE_RFQ_STATUS_FAILURE', payload: error.message });
        }
    };
};


/**
 * 
 * case 'CHANGE_RFQ_STATUS_REQUEST':
        return { ...state, loading: true, error: null };
      case 'CHANGE_RFQ_STATUS_SUCCESS':
        return { ...state, loading: false, changeRfqStatus: action.payload || [] };
      case 'CHANGE_RFQ_STATUS_FAILURE':
        return { ...state, loading: false, changeRfqStatusError: action.payload };
 * 
 */