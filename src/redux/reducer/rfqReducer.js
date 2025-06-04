const initialState = {
    rfqData: undefined,
    adminRfqData: undefined,
    error: null,
    loading: false,
    rfqCreateStatus: false,
    rfqCreateError: null,
    productList: undefined,
    quoteCreateStatus: false,
    quoteCreateError: null,
    poCreateStatus: false,
    poCreateError: null,
    poData: undefined,
    supplierpoData: undefined,
    supplierRejectedPoData: undefined,
    supplierAcceptedPoData: undefined,
    allpoData: undefined,
    taxCategoryData: undefined,
  };
  
  const rfqReducer = (state = initialState, action) => {
    switch (action.type) {
      case 'GET_RFQ_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_RFQ_SUCCESS':
        return { ...state, loading: false, rfqData: action.payload || [] };
      case 'GET_RFQ_FAILURE':
        return { ...state, loading: false, error: action.payload };

      case 'GET_PO_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_PO_SUCCESS':
        return { ...state, loading: false, poData: action.payload || [] };
      case 'GET_PO_FAILURE':
        return { ...state, loading: false, error: action.payload };

      case 'GET_SUPPLIER_PO_REQUEST':
          return { ...state, loading: true, error: null };
      case 'GET_SUPPLIER_PO_SUCCESS':
          return { ...state, loading: false, supplierpoData: action.payload || [] };
      case 'GET_SUPPLIER_PO_FAILURE':
        return { ...state, loading: false, error: action.payload };

        
      case 'GET_ACCEPTED_SUPPLIER_PO_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_ACCEPTED_SUPPLIER_PO_SUCCESS':
          return { ...state, loading: false, supplierAcceptedPoData: action.payload || [] };
      case 'GET_ACCEPTED_SUPPLIER_PO_FAILURE':
        return { ...state, loading: false, error: action.payload };

        case 'GET_REJECTED_SUPPLIER_PO_REQUEST':
          return { ...state, loading: true, error: null };
        case 'GET_REJECTED_SUPPLIER_PO_SUCCESS':
            return { ...state, loading: false, supplierRejectedPoData: action.payload || [] };
        case 'GET_REJECTED_SUPPLIER_PO_FAILURE':
          return { ...state, loading: false, error: action.payload };

      case 'GET_ALL_PO_REQUEST':
          return { ...state, loading: true, error: null };
      case 'GET_ALL_PO_SUCCESS':
          return { ...state, loading: false, allpoData: action.payload || [] };
      case 'GET_ALL_PO_FAILURE':
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

      case 'CREATE_QUOTE_REQUEST':
        return { ...state, loading: true};
      case 'CREATE_QUOTE_SUCCESS':
        return { ...state, loading: false, quoteCreateStatus: true };
      case 'CREATE_QUOTE_FAILURE':
        return { ...state, loading: false, quoteCreateError: action.payload };

      case 'CREATE_PO_REQUEST':
        return { ...state, loading: true};
      case 'CREATE_PO_SUCCESS':
        return { ...state, loading: false, poCreateStatus: true };
      case 'CREATE_PO_FAILURE':
        return { ...state, loading: false, poCreateError: action.payload };

      case 'GET_ADMIN_RFQ_REQUEST':
        return { ...state, loading: true};
      case 'GET_ADMIN_RFQ_SUCCESS':
        return { ...state, loading: false, adminRfqData: action.payload || [] };
      case 'GET_ADMIN_RFQ_FAILURE':
        return { ...state, loading: false, error: action.payload };

      case 'GET_TAX_CATEGORY_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_TAX_CATEGORY_SUCCESS':
        return { ...state, loading: false, taxCategoryData: action.payload || [] };
      case 'GET_TAX_CATEGORY_REQUEST_FAILURE':
        return { ...state, loading: false, error: action.payload };

      case 'GET_SUPPLIER_LIST_REQUEST':
        return { ...state, loading: true };
      case 'GET_SUPPLIER_LIST_SUCCESS':
        console.log("Supplier List Action Payload:", action.payload);
            return { ...state, loading: false, suppliers: action.payload?.data, totalSuppliers: action.payload?.total_record || 0 }; 
        case 'GET_SUPPLIER_LIST_FAILURE':
          return { ...state, loading: false, error: action.payload };
  
      case 'RESET_RFC_CREATE_STATUS':
        return {...state, rfqCreateStatus: false}

      default:
        return state;
    }
  };
  
  export default rfqReducer;
  