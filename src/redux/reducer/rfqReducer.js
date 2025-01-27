const initialState = {
    rfqData: undefined,
    error: null,
    loading: false,
    rfqCreateStatus: false,
    rfqCreateError: null,
  };
  
  const rfqReducer = (state = initialState, action) => {
    switch (action.type) {
      case 'GET_RFQ_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_RFQ_SUCCESS':
        return { ...state, loading: false, rfqData: action.payload || [] };
      case 'GET_RFQ_FAILURE':
        return { ...state, loading: false, error: action.payload };
      
      case 'CREATE_RFQ_REQUEST':
        return { ...state, loading: true};
      case 'CREATE_RFQ_SUCCESS':
        return { ...state, loading: false, rfqCreateStatus: true };
      case 'CREATE_RFQ_FAILURE':
        return { ...state, loading: false, rfqCreateError: action.payload };
     
      case 'RESET_RFC_CREATE_STATUS':
        return {...state, rfqCreateStatus: false}

      default:
        return state;
    }
  };
  
  export default rfqReducer;
  