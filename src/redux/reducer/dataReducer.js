const initialState = {
    allSupplier: [],
    allConsumer:[],
    allSupplierLoading: false,
    allConsumerLoading: false,
    supplierError: null,
    consumerError: null
}

const dataRedsucer = (state = initialState, action) => {
    switch(action.type){
        case  'GET_ALL_CONSUMNER_REQUEST' :
            return {
                ...state,
                allConsumerLoading: true,
            };
        case 'GET_ALL_CONSUMNER_SUCCESS' : 
            return {
                ...state,
                allConsumerLoading: false,
                allConsumer: action.payload
            };
        case 'GET_ALL_CONSUMNER_FAILURE' : 
            return {
                ...state,
                allConsumerLoading: false,
                error: action.payload
            };
        
        case  'GET_ALL_SUPPLIER_REQUEST' :
            return {
                ...state,
                allSupplierLoading: true,
            };
        case 'GET_ALL_SUPPLIER_SUCCESS' : 
            return {
                ...state,
                allSupplierLoading: false,
                allSupplier: action.payload
            };
        case 'GET_ALL_SUPPLIER_FAILURE' : 
            return {
                ...state,
                allSupplierLoading: false,
                error: action.payload
            };

        default : 
            return {
                ...state
            }
    }
}

export default dataRedsucer;