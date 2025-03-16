const initialState = {
    rfqReceivedData: undefined,
    error: null,
    loading: false,
    changeRfqStatus: false,
    changeRfqStatusError: null,
    rfqRejectedData: undefined,
    quoteAllData: undefined,
    quoteSupplierData: undefined,
    quoteConsumerData: undefined,
    acceptRejectQuoteStatus: false,
    acceptRejectQuoteStatusError: null,
    acceptRejectPOAdminStatus: false,
    acceptRejectPOAdminStatusError: null,
    acceptRejectPOSupplierStatus: false,
    acceptRejectPOSupplierStatusError: null,
  };
  
  // https://factory.demosite.name/api/Api/getSupplierRFQList
  const supplierRfqReducer = (state = initialState, action) => {
    switch (action.type) {
      case 'GET_SUPPLIER_RFQ_LIST_REQUEST':
        return { ...state, loading: true, error: null };
      case 'GET_SUPPLIER_RFQ_LIST_SUCCESS':
        return { ...state, loading: false, rfqReceivedData: action.payload || [] };
      case 'GET_SUPPLIER_RFQ_LIST_FAILURE':
        return { ...state, loading: false, error: action.payload };

        case 'GET_SUPPLIER_RFQ_REJECTED_LIST_REQUEST':
          return { ...state, loading: true, error: null };
        case 'GET_SUPPLIER_RFQ_REJECTED_LIST_SUCCESS':
          return { ...state, loading: false, rfqRejectedData: action.payload || [] };
        case 'GET_SUPPLIER_RFQ_REJECTED_LIST_FAILURE':
          return { ...state, loading: false, error: action.payload };

        case 'GET_SUPPLIER_QUOTE_LIST_REQUEST':
          return { ...state, loading: true, error: null };
        case 'GET_SUPPLIER_QUOTE_LIST_SUCCESS':
          return { ...state, loading: false, quoteSupplierData: action.payload || [] };
        case 'GET_SUPPLIER_QUOTE_LIST_FAILURE':
          return { ...state, loading: false, error: action.payload };

        case 'GET_ALL_QUOTE_LIST_REQUEST':
          return { ...state, loading: true, error: null };
        case 'GET_ALL_QUOTE_LIST_SUCCESS':
          return { ...state, loading: false, quoteAllData: action.payload || [] };
        case 'GET_ALL_QUOTE_LIST_FAILURE':
          return { ...state, loading: false, error: action.payload };
      
        case 'GET_CONSUMER_QUOTE_LIST_REQUEST':
          return { ...state, loading: true, error: null };
        case 'GET_CONSUMER_QUOTE_LIST_SUCCESS':
          return { ...state, loading: false, quoteConsumerData: action.payload || [] };
        case 'GET_CONSUMER_QUOTE_LIST_FAILURE':
          return { ...state, loading: false, error: action.payload };
      case 'CHANGE_RFQ_STATUS_REQUEST':
        return { ...state, loading: true, error: null };
      case 'CHANGE_RFQ_STATUS_SUCCESS':
        return { ...state, loading: false, changeRfqStatus: action.payload || [] };
      case 'CHANGE_RFQ_STATUS_FAILURE':
        return { ...state, loading: false, changeRfqStatusError: action.payload };
      case 'ACCEPT_REJECT_QUOTE_REQUEST':
        return { ...state, loading: true, error: null };
      case 'ACCEPT_REJECT_QUOTE_SUCCESS':
        return { ...state, loading: false, acceptRejectQuoteStatus: action.payload || [] };
      case 'ACCEPT_REJECT_QUOTE_FAILURE':
        return { ...state, loading: false, acceptRejectQuoteStatusError: action.payload };

      case 'ACCEPT_REJECT_PO_REQUEST_ADMIN':
        return { ...state, loading: true, error: null };
      case 'ACCEPT_REJECT_PO_REQUEST_ADMIN_SUCCESS':
        return { ...state, loading: false, acceptRejectPOAdminStatus: action.payload || [] };
      case 'ACCEPT_REJECT_PO_REQUEST_ADMIN_FAILURE':
        return { ...state, loading: false, acceptRejectPOAdminStatusError: action.payload };
        
      case 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER':
        return { ...state, loading: true, error: null };
      case 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER_SUCCESS':
        return { ...state, loading: false, acceptRejectPOSupplierStatus: action.payload || [] };
      case 'ACCEPT_REJECT_PO_REQUEST_SUPPLIER_FAILURE':
        return { ...state, loading: false, acceptRejectPOSupplierStatusError: action.payload };

      /*case 'CREATE_RFQ_REQUEST':
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
      */
      default:
        return state;
    }
  };
  
  export default supplierRfqReducer;
  