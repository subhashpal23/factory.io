import { notification } from 'antd'
export const getRfqList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_RFQ_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getCustomerRFQList', {
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
            dispatch({ type: 'GET_RFQ_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_RFQ_FAILURE', payload: error.message });
        }
    };
}


export const getAdminRfqLists = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ADMIN_RFQ_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/AllRFQList', {
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
            dispatch({ type: 'GET_ADMIN_RFQ_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_ADMIN_RFQ_FAILURE', payload: error.message });
        }
    };
}


export const createRfq = (rfq, token) => {
    return async (dispatch) => {
        dispatch({ type: 'CREATE_RFQ_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/createRFQ', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(rfq), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'CREATE_RFQ_SUCCESS', payload: data });
            notification.success({
                message: 'RFQ created successfully!',
                placement: 'topRight',
              });
        } catch (error) {
            dispatch({ type: 'CREATE_RFQ_FAILURE', payload: error.message });
        }
    };
}

export const createQuote = (rfq, token) => {
    return async (dispatch) => {
        dispatch({ type: 'CREATE_QUOTE_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/generateQuote', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(rfq), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'CREATE_QUOTE_SUCCESS', payload: data });
            notification.success({
                message: 'Quote submitted successfully!',
                placement: 'topRight',
              });
        } catch (error) {
            dispatch({ type: 'CREATE_QUOTE_FAILURE', payload: error.message });
        }
    };
}

export const getProductList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_PRODUCT_LIST_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/getProducts', {
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
            dispatch({ type: 'GET_PRODUCT_LIST_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_PRODUCT_LIST_FAILURE', payload: error.message });
        }
    };
}



export const resetRfcCreateStatus = () => {
    return async (dispatch) => {
        dispatch({type: 'RESET_RFC_CREATE_STATUS'})
    }
}

export const createPO = (po, token) => {
    return async (dispatch) => {
        dispatch({ type: 'CREATE_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/createPurchaseOrder', {
                method: 'POST', 
                headers: {
                    'Content-Type': 'application/json', 
                'Authorization': `Bearer ${token}` 
                },
                body: JSON.stringify(po), // Send the data as JSON
            });

            if (!response.ok) {
                throw new Error(`Error: ${response.status} ${response.statusText}`);
            }
            const data = await response.json();
            dispatch({ type: 'CREATE_PO_SUCCESS', payload: data });
            notification.success({
                message: 'PO submitted successfully!',
                placement: 'topRight',
              });
        } catch (error) {
            dispatch({ type: 'CREATE_PO_FAILURE', payload: error.message });
        }
    };
}

export const getPOList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/ConsumerPurchaseOrder', {
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
            dispatch({ type: 'GET_PO_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_PO_FAILURE', payload: error.message });
        }
    };
}

export const getSupplierPOList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_SUPPLIER_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/SupplierPurchaseOrder', {
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
            dispatch({ type: 'GET_SUPPLIER_PO_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_SUPPLIER_PO_FAILURE', payload: error.message });
        }
    };
}

export const getAcceptedSupplierPOList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ACCEPTED_SUPPLIER_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/SupplierPurchaseOrderAccepted', {
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
            dispatch({ type: 'GET_ACCEPTED_SUPPLIER_PO_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_ACCEPTED_SUPPLIER_PO_FAILURE', payload: error.message });
        }
    };
}

export const getRejectedSupplierPOList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_REJECTED_SUPPLIER_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/SupplierPurchaseOrderRejected', {
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
            dispatch({ type: 'GET_REJECTED_SUPPLIER_PO_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_REJECTED_SUPPLIER_PO_FAILURE', payload: error.message });
        }
    };
}

export const getAdminPOList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_ALL_PO_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/allPurchaseOrder', {
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
            dispatch({ type: 'GET_ALL_PO_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_ALL_PO_FAILURE', payload: error.message });
        }
    };
}


export const getTaxCategoryList = (token) => {
    return async (dispatch) => {
        dispatch({ type: 'GET_TAX_CATEGORY_REQUEST' });
        try {
            const response = await fetch('https://factory.demosite.name/api/Api/taxCategory', {
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
            dispatch({ type: 'GET_TAX_CATEGORY_SUCCESS', payload: data });
        } catch (error) {
            dispatch({ type: 'GET_TAX_CATEGORY_FAILURE', payload: error.message });
        }
    };
}