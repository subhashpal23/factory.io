const initialState = {
    rfqData: undefined,
    adminRfqData: undefined,
    error: null,
    loading: false,
    rfqCreateStatus: false,
    rfqCreateError: null,
    productList: undefined
  };
  
  const rfqReducer = (state = initialState, action) => {
    switch (action.type) {
      case 'GET_RFQ_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_RFQ_SUCCESS':
        return { ...state, loading: false, rfqData: action.payload || [] };
      case 'GET_RFQ_FAILURE':
        return { ...state, loading: false, error: action.payload };

     case 'GET_PRODUCT_LIST_REQUEST':
          return { ...state, loading: true, error: null };
      case 'GET_PRODUCT_LIST_SUCCESS':
        return { ...state, loading: false, productList: action.payload?.data || [] };
      case 'GET_PRODUCT_LIST_FAILURE':
        return { ...state, loading: false, error: action.payload };
      
      case 'CREATE_RFQ_REQUEST':
        return { ...state, loading: true};
      case 'CREATE_RFQ_SUCCESS':
        return { ...state, loading: false, rfqCreateStatus: true };
      case 'CREATE_RFQ_FAILURE':
        return { ...state, loading: false, rfqCreateError: action.payload };

      case 'GET_ADMIN_RFQ_REQUEST':
        return { ...state, loading: true};
      case 'GET_ADMIN_RFQ_SUCCESS':
        return { ...state, loading: false, adminRfqData: action.payload || [] };
      case 'GET_ADMIN_RFQ_FAILURE':
        return { ...state, loading: false, error: action.payload };
     
      case 'RESET_RFC_CREATE_STATUS':
        return {...state, rfqCreateStatus: false}

      default:
        return state;
    }
  };
  
  export default rfqReducer;
  