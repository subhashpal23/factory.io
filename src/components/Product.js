import React, {useEffect} from "react";
import { useDispatch, useSelector } from "react-redux";
import { fetchProducts } from "../redux/actions/productActions";
const Product = () => {
    const dispatch = useDispatch();
    const { products, loading, error } = useSelector((state) => state.product);
    useEffect(() => {
            dispatch(fetchProducts());
        }, [dispatch]);
    if (loading) {
        return <div>Loading...</div>;
    }

    if (error) {
        return <div>Error: {error}</div>;
    }


    return (
        <div>
            <h1>Product List</h1>
            {products.length > 0 ? (
                <ul>
                    {products.map((product) => (
                        <li key={product.id}>{
                            <div style={{display:"flex",flexFlow:"horizontal",marginRight:"10px"}}>
                                <div>{product.title+" "}</div>
                                <div>{` Price : ${product.price}`}</div>
                            </div>
                        }</li>
                    ))}
                </ul>
            ) : (
                <p>No Product found</p>
            )}
        </div>
    );

    return <>
        Product Page
    </>
}

export default Product;