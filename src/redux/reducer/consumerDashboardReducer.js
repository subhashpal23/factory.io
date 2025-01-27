const initialState = {
    supplierList: [],
    error: null,
    loading: false,
  };
  
  const consumerDashboardReducer = (state = initialState, action) => {
    switch (action.type) {
      case 'GET_SUPPLIER_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_SUPPLIER_SUCCESS':
        return { ...state, loading: false, supplierList: action.payload.data || [] };
      case 'GET_SUPPLIER_FAILURE':
        return { ...state, loading: false, error: action.payload };
      default:
        return state;
    }
  };
  
  export default consumerDashboardReducer;
  