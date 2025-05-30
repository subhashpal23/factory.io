//import { notification } from 'antd'
import { API_URL } from '../../utils/Config';
import { showErrorNotification, showSuccessNotification } from "../../utils/AppNotification";
export const getSupplierRfqReceivedList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_RFQ_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/getSupplierRFQList`, {
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
            const response = await fetch(`${API_URL}/Api/getSupplierRejectedRFQList`, {
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

export const getSupplierRfqAcceptedList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_RFQ_ACCEPTED_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/getSupplierAcceptedRFQList`, {
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
            dispatch({ type: 'GET_SUPPLIER_RFQ_ACCEPTED_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_RFQ_ACCEPTED_LIST_FAILURE', payload: error.message });
        }
    };
}



export const getSupplierQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/allQuotationListForSupplier`, {
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

export const getAllQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ALL_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/allQuotationList`, {
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
            dispatch({ type: 'GET_ALL_QUOTE_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_ALL_QUOTE_LIST_FAILURE', payload: error.message });
        }
    };
}

export const getConsumerQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_CONSUMER_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/allQuotationListForConsumer`, {
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
            dispatch({ type: 'GET_CONSUMER_QUOTE_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_CONSUMER_QUOTE_LIST_FAILURE', payload: error.message });
        }
    };
}

export const getConsumerAcceptedQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_CONSUMER_ACCEPTED_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/acceptedQuotationListForConsumer`, {
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
            dispatch({ type: 'GET_CONSUMER_ACCEPTED_QUOTE_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_CONSUMER_ACCEPTED_QUOTE_LIST_FAILURE', payload: error.message });
        }
    };
}

export const getConsumerRejectedQuoteList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_CONSUMER_REJECTED_QUOTE_LIST_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/rejectedQuotationListForConsumer`, {
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
            dispatch({ type: 'GET_CONSUMER_REJECTED_QUOTE_LIST_SUCCESS', payload: data });
            
        } catch (error) {
            dispatch({ type: 'GET_CONSUMER_REJECTED_QUOTE_LIST_FAILURE', payload: error.message });
        }
    };
}


export const changeRfqStatus = (token,requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'CHANGE_RFQ_STATUS_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/changeRFQStatus`, {
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


export const acceptRejectQuote = (token, requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'ACCEPT_REJECT_QUOTE_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/acceptRejectQuotation`, {
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
            dispatch({ type: 'ACCEPT_REJECT_QUOTE_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'ACCEPT_REJECT_QUOTE_FAILURE', payload: error.message });
        }
    };
};

export const acceptRejectQuoteByCustomer = (token, requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'ACCEPT_REJECT_QUOTE_CUSTOMER_REQUEST' });
        try {
            const response = await fetch(`${API_URL}/Api/acceptRejectCustomerQuotation`, {
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
            dispatch({ type: 'ACCEPT_REJECT_QUOTE_CUSTOMER_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'ACCEPT_REJECT_QUOTE_CUSTOMER_FAILURE', payload: error.message });
        }
    };
};


export const acceptRejectPObyAdmin = (token, requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_ADMIN' });
        try {
            const response = await fetch(`${API_URL}/Api/acceptRejectPurchaseOrder`, {
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
            dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_ADMIN_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_ADMIN_FAILURE', payload: error.message });
        }
    };
};

export const acceptRejectPObySupplier = (token, requestRfqStatus) => {
    return async (dispatch) => {
        //userData = {...userData, role_type: userType}
        dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER' });
        try {
            const response = await fetch(`${API_URL}/Api/acceptRejectPOBySupplier`, {
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
            dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER_FAILURE', payload: error.message });
        }
    };
};

export const updateQuoteCommissionAdmin = (token, requestRfqStatus) => {
    return async (dispatch) => {
        dispatch({ type: 'UPDATE_QUOTE_COMMISSION_REQUEST_ADMIN' });
        try {
            const response = await fetch(`${API_URL}/Api/updateQuoteCommission`, {
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
            dispatch({ type: 'UPDATE_QUOTE_COMMISSION_REQUEST_ADMIN_SUCCESS', payload: data});
        } catch (error) {
            showErrorNotification(error.message)
            dispatch({ type: 'UPDATE_QUOTE_COMMISSION_REQUEST_ADMIN_FAILURE', payload: error.message });
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