const initialState = {
    lastAssignedSuppler: undefined,
    assignStatus:false ,
    loading:false,   
}

const assignRfqReducer = (state = initialState, action) => {
    switch(action.type){
        case  'ASSIGN_SUPPLIER_RFQ_REQUEST' :
            return {
                ...state,
                loading: true,
                lastAssignedSuppler: action.payload
            };
        case 'ASSIGN_SUPPLIER_RFQ_SUCCESS' : 
            return {
                ...state,
                laoding: false,
                assignStatus: true
            };
        case 'ASSIGN_SUPPLIER_RFQ_FAILURE' : 
            return {
                ...state,
                laoding: false,
                error: action.payload
            };
        case 'RESET_RFQ_ASSIGN_STATUS': 
        return {
            ...state,
            assignStatus: false
        }
        default : 
            return {
                ...state
            }
    }
}

export default assignRfqReducer;