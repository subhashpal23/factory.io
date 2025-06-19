import React, { useState, useEffect } from 'react';
import { API_URL } from '../utils/Config';
import './SupplierDetailsPage.css'; // Import the CSS file
import { useDispatch, useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { getUserInfo } from '../redux/actions/userActions';
import { Button } from "antd";
import { useNavigate } from 'react-router-dom';

const SupplierDetailsPage = () => {
    const dispatch = useDispatch();
    const token = useSelector((state) => state.auth.logindata.token);
    const userDetail = useSelector((state) => state.user.userDetail);
    let { id } = useParams();
    const navigate = useNavigate();

    useEffect(() => {
          if (token) {
            dispatch(getUserInfo(token,id));
          }
    }, [dispatch, token,id]);

    const machinery_list = userDetail?.machinery_list ? JSON.parse(userDetail.machinery_list) : [];
    const core_product_photos = userDetail?.core_product_photos ? JSON.parse(userDetail.core_product_photos) : []
  const handleClick = () => {
    const menuItems = document.querySelectorAll('li.ant-menu-item');
    const lastItem = menuItems[menuItems.length - 1];
    if (lastItem) {
      lastItem.click();
    } else {
      console.warn('No menu items found');
    }
  }

  return (
      <div>
        <div className="flex-wrap-container">
          <Button onClick={handleClick} type="primary" style={{marginBottom:15}}>
            {"<"} Back to supplier search
          </Button>
        </div>
        <div style={{ display: 'flex', flexWrap: 'wrap', alignItems: 'flex-start', gap: '20px' }}>

          <div style={{ flex: '1 1 300px', minWidth: '280px' }}>
          {userDetail?.company && 
            <div style={{ display: 'flex', alignItems: 'center', marginBottom: '20px' }}>
              <div style={{ flex: '0 0 100px', marginRight: '20px' }}>
                <img src={`${API_URL}/${userDetail?.company_logo}`} alt="Logo" style={{ width: '100px', height: 'auto' }} />
              </div>
              <div style={{ flex: 1 }}>
                <h2 style={{ margin: 0, fontSize: '28px', color: '#000' }}>
                 {userDetail?.company}
                  {/* <img src={`https://factory.demosite.name/api/${userDetail?.company_portflio}`} alt="Verified Supplier Badge" style={{ height: '24px', verticalAlign: 'middle', display:'block' }} /> */}
                </h2>
                <p style={{ margin: '5px 0', color: '#555' }}>
                  📍 {userDetail?.address} &nbsp;&nbsp; ⚙️ {userDetail?.company_type} &nbsp;&nbsp; ✅ GST
                </p>
              </div>
            </div>
}


            <div>
              <h3 style={{ margin: '0 0 10px' }}>About this Supplier</h3>
              <p style={{ margin: '0 0 10px', color: '#333' }}>
              {userDetail?.about_us}
              </p>
            </div>
          </div>



          <div style={{ flex: '1 1 300px', minWidth: '280px', display: 'flex', flexWrap: 'wrap', gap: '10px' }}>
            <img src={`${API_URL}/${userDetail?.production_facility_photos}`} style={{ width: 'calc(50% - 5px)', height: '150px', borderRadius: '8px' }} alt="Image 1" />
            <img src={`${API_URL}/${userDetail?.qc_area_photos}`} style={{ width: 'calc(50% - 5px)', height: '150px', borderRadius: '8px' }} alt="Image 1" />
            <img src={`${API_URL}/${userDetail?.production_line_photos}`} style={{ width: 'calc(50% - 5px)', height: '150px', borderRadius: '8px' }} alt="Image 1" />
            <img src={`${API_URL}/${userDetail?.warehouse_photos}`} style={{ width: 'calc(50% - 5px)', height: '150px', borderRadius: '8px' }} alt="Image 1" />
          </div>

        </div>




        {userDetail?.address && 
        <>
         <h3 style={{ fontWeight: 'bold' }}>State</h3>
        <div style={{ fontFamily: 'Arial, sans-serif', margin: 'auto', padding: '20px' }}>



          <span style={{ display: 'inline-block', padding: '5px 12px', backgroundColor: '#e5f0fb', borderRadius: '8px', color: '#1e40af', fontWeight: 500, marginBottom: '20px' }}>
          {userDetail?.address}
          </span>


        </div>
        </>
       
}

        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Company Information</h3>

        <div style={{
          display: 'flex',
          flexWrap: 'wrap',
          justifyContent: 'space-between',
          border: '1px dashed #60a5fa',
          borderRadius: '10px',
          padding: '20px',
          maxWidth: '100%',
          gap: '20px',
          marginTop: '5px',
          backgroundColor: '#fff',
          fontFamily: 'sans-serif'
        }}>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Company Type</div>
            <div style={{ display: 'flex', alignItems: 'center', fontSize: '16px' }}>
              <strong style={{ color: '#111' }}>{userDetail?.industry}</strong>
            </div>
          </div>

          <div style={{ flex: '1', minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Company Portfolio</div>
            <div style={{ display: 'flex', alignItems: 'center' }}>

              <a href={`${API_URL}/${userDetail?.company_portflio}`} target="_blank" style={{ color: '#007bff', textDecoration: 'none', fontWeight: 500 }}>
                View Portfolio
              </a>

            </div>
          </div>

          <div style={{ flex: '1', minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Freezone Status</div>
            <div style={{ display: 'flex', alignItems: 'center' }}>
              <strong style={{ color: '#111' }}>{userDetail?.freezone === '0' ? 'No' : 'Yes' }</strong>
            </div>
          </div>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Operating Days </div>
            <div style={{ display: 'flex', alignItems: 'center' }}>
              <strong style={{ color: '#111' }}>{userDetail?.operating_days}</strong>
            </div>
          </div>


        </div>
        <div style={{
          display: 'flex',
          flexWrap: 'wrap',
          justifyContent: 'space-between',
          border: '1px dashed #60a5fa',
          borderRadius: '10px',
          padding: '20px',
          maxWidth: '100%',
          gap: '20px',
          backgroundColor: '#fff',
          fontFamily: 'sans-serif',
          marginTop: '5px'
        }}>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Annual Turnover</div>
            <div style={{ display: 'flex', alignItems: 'center', fontSize: '16px' }}>
              📈&nbsp; <strong style={{ color: '#111' }}>{userDetail?.anual_turnover}</strong>
            </div>
          </div>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Company Size</div>
            <div style={{ display: 'flex', alignItems: 'center' }}>
              🏢&nbsp; <strong style={{ color: '#111' }}>11 - 50</strong>
            </div>
          </div>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Established In</div>
            <div style={{ display: 'flex', alignItems: 'center' }}>
              📅&nbsp; <strong style={{ color: '#111' }}>{userDetail?.year_of_establishment}</strong>
            </div>
          </div>

          <div style={{ flex: 1, minWidth: '150px' }}>
            <div style={{ color: '#6b7280', fontWeight: 600 }}>Number of Employees </div>
            <div style={{ display: 'flex', alignItems: 'center' }}>
              🧑‍💼&nbsp; <strong style={{ color: '#111' }}>{userDetail?.employeeCount}</strong>
            </div>
          </div>


        </div>
        {userDetail?.company && 
<>
<h3  style={{ fontWeight: 'bold',marginBottom: '20px',marginTop: '20px'  }} >Business Information</h3>

<div style={{
          display: 'flex',
          flexWrap: 'wrap',
          justifyContent: 'space-between',
          border: '1px dashed #60a5fa',
          borderRadius: '10px',
          padding: '20px',
          maxWidth: '100%',
          gap: '20px',
          backgroundColor: '#fff',
          fontFamily: 'sans-serif',
          marginTop: '5px'
        }}>
          <div style={{ flex: 1, minWidth: '200px' }}>
            <div style={{ color: 'gray' }}>Name</div>
            <div style={{ fontWeight: 'bold' }}>{userDetail?.company}</div>
          </div>

          <div style={{ flex: 1, minWidth: '200px' }}>
            <div style={{ color: 'gray' }}>Phone Number</div>
            <div style={{ fontWeight: 'bold' }}>{userDetail?.mobile_phone}</div>
          </div>

          <div style={{ flex: 1, minWidth: '200px' }}>
            <div style={{ color: 'gray' }}>Email</div>
            <div style={{ fontWeight: 'bold' }}>{userDetail?.company_email}</div>
          </div>

          <div style={{ flex: 1, minWidth: '200px' }}>
            <div style={{ color: 'gray' }}>Company Email</div>
            <div style={{ fontWeight: 'bold' }}>{userDetail?.company_email}</div>
          </div>

          <div style={{ flex: 1, minWidth: '200px' }}>
            <div style={{ color: 'gray' }}>Company Website</div>
            <div style={{ fontWeight: 'bold' }}>{userDetail?.company_website}</div>
          </div>
        </div>
</>
}
       




{userDetail?.office_address && 

  <>
   <h3 style={{ fontWeight: 'bold', marginTop: '20px' }}>Addresses</h3>

<div className="address-container">
  <div className="address-box">
    <strong>Office Address</strong><br />
    {userDetail?.office_address}
  </div>

  <div className="address-box">
    <strong>Factory Address</strong><br />
    {userDetail?.factory_address}
  </div>
</div>



<h3 style={{ fontWeight: 'bold', marginTop: '20px' }}>Addresses</h3>
<div style={{ boxShadow: '0 0 8px rgba(0,0,0,0.1)', borderRadius: '10px', padding: '15px', marginBottom: '30px', maxWidth: '400px' }}>
  <strong>Shipping Address</strong><br />
  {userDetail?.shipping_address}
</div>

  </>
       

}
        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Services</h3>
        <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'left', marginTop: '20px' }}>
          {userDetail?.services?.split(',').map(val => {
            return (<div style={{ backgroundColor: '#e7f3ff', borderRadius: '5px', padding: '10px', margin: '5px', minWidth: '150px', textAlign: 'left' }}>
             {val}
            </div>)
          })}
          
          
        </div>

        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' , marginTop:"10px"}}>Manufacturing Processes</h3>

        <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'left', marginTop: '20px' }}>
        {userDetail?.mpid?.split(',').map(val => {
            return (<div style={{ backgroundColor: '#e7f3ff', borderRadius: '5px', padding: '10px', margin: '5px', minWidth: '150px', textAlign: 'left' }}>
             {val}
            </div>)
          })}
          
        </div>

        <h3 style={{ fontWeight: 'bold', marginTop: '20px' }}>Manufacturing Capabilities</h3>

        <div className="address-container">
          <div className="address-box">
            <strong>Key Customers</strong><br />
            {userDetail?.key_customers}
          </div>

          <div className="address-box">
            <strong>Past Projects </strong><br />
            {userDetail?.past_project}
          </div>
        </div>
        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Machinery & Equipment</h3>
        <table>
          <thead>
            <tr>
              <th>Machinery Name</th>
              <th>Quantity</th>
              <th>Brand/Model</th>
              <th>Production Capacity</th>
              <th>Machine Photos</th>
              <th>Technical Specifications</th>
            </tr>
          </thead>
          <tbody>
            {
              machinery_list.map(row =>{
                return (<tr>
                  <td>{row.name}</td>
                  <td>{row.quantity}</td>
                  <td>{row.brand_model}</td>
                  <td>{row.production_capacity}</td>
                  <td>
                  <a href={`${API_URL}/${row?.machine_photos}`} target="_blank" style={{ color: '#007bff', textDecoration: 'none', fontWeight: 500 }}>
                  View Photo
                 </a>
                  </td>
                

                  <td>{row.technical_specifications}</td>
                </tr>)
              })
            }
            
         
          </tbody>
        </table>


        <h3 style={{ fontWeight: 'bold', marginBottom: '20px', marginTop:'20px' }}>MOQ</h3>
        <div style={{ fontFamily: 'Arial, sans-serif', margin: 'auto', padding: '20px' }}>


          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '40px' }}>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Sample Order</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.sample_order_moq}</div>
            </div>


            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Production Order</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.production_order_moq}</div>
            </div>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>General MOQ Policy</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.general_moq_policy}</div>
            </div>


          </div>
        </div>
        <h3 style={{ fontWeight: 'bold', marginTop: '20px' }}>Quality Assurance</h3>

        <div class="address-container">
          <div class="address-box">
            <strong>Quality Control Process</strong><br />
            {userDetail?.quality_control_process}
          </div>

          <div class="address-box">
            <strong>Testing Capabilities </strong><br />
            {userDetail?.testing_capabilities}
          </div>
        </div>

        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Business Performance</h3>
        <div style={{ fontFamily: 'Arial, sans-serif',  margin: 'auto', padding: '20px' }}>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '40px' }}>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Years in Export</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}> {userDetail?.years_in_export}</div>
            </div>


            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Average Lead Time</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}> {userDetail?.average_lead_time}</div>
            </div>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Export Markets</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}> {userDetail?.export_markets}</div>
            </div>
          </div>
        </div>

        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Sustainability & Compliance</h3>
        <div style={{ fontFamily: 'Arial, sans-serif',  margin: 'auto', padding: '20px' }}>
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '40px' }}>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Environmental Certifications</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.environmental_cert_text}</div>
            </div>


            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Social Compliance Certifications</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.social_compliance_text}</div>
            </div>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Sustainable Practices</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.sustainable_practices}</div>
            </div>
          </div>
        </div>

        <h3 style={{ fontWeight: 'bold', marginBottom: '20px' }}>Financial Information</h3>
        <div style={{ fontFamily: 'Arial, sans-serif',  margin: 'auto', padding: '20px' }}>

        {userDetail?.bank_details &&      
          <div style={{ display: 'flex', flexWrap: 'wrap', gap: '40px' }}>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Bank Details</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.bank_details}</div>
            </div>


            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Payment Term</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.payment_terms}</div>
            </div>

            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>GST/Vat Number</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>{userDetail?.gst_no}</div>
            </div>


            <div style={{ flex: 1, minWidth: '200px' }}>
              <div style={{ color: 'gray' }}>Tax Document</div>
              <div style={{ fontWeight: 'bold', marginTop: '5px' }}>
                <div style={{
                  display: 'inline-flex',
                  alignItems: 'center',
                  gap: '12px',
                  border: '1px solid #cbd5e1',
                  borderRadius: '8px',
                  padding: '16px 20px',
                  maxWidth: '320px',
                  backgroundColor: '#fff',
                  marginBottom: '20px'
                }}>
                  <div>
                    <a href={`${API_URL}/${userDetail?.tax_documents}`} target="_blank" style={{ color: '#007bff', textDecoration: 'none', fontWeight: 500 }}>
                      View Document
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div>
}
        </div>
          {userDetail?.certificate &&        
         <div>
         <h2>Certifications</h2>
        <div style={{
          display: 'inline-flex',
          alignItems: 'center',
          gap: '12px',
          border: '1px solid #cbd5e1',
          borderRadius: '8px',
          padding: '16px 20px',
          maxWidth: '320px',
          backgroundColor: '#fff',
          marginBottom: '20px'
        }}>
          <div>
            <a href={userDetail?.certificate}  target="_blank" style={{ color: '#007bff', textDecoration: 'none', fontWeight: 500 }}>
              View Certificate
            </a>
          </div>
        </div>
          </div>   
}    
 

        
        <h2>Products</h2>
        <div className="grid-container">
          {core_product_photos.map(row => {
            return   <img src={`${API_URL}/${row}`} alt="Sample product image 1" />
          })}
        
          
        </div>

      </div>


  );
};

export default SupplierDetailsPage;