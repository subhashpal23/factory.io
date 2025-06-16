import {
    Button,
    Card,
    Input as AntdInput,
    Space,
    Tag,
    Typography,
    Row,
    Col,
    Select as AntdSelect,
    Pagination,
    Modal,
    notification
} from 'antd';
import styled, { keyframes } from 'styled-components';
import { SearchOutlined } from '@ant-design/icons';
import React, { useState, useEffect } from 'react';
import TopNavigation from './TopNavigation';
import Footer from './Footer';
import {
    CountryCodes,
    industriesType
} from './../components/Registration/constants';
import { useDispatch, useSelector } from 'react-redux';
import { getSuppliersList } from '../redux/actions/rfqAction';
import { API_URL } from '../utils/Config';
import '../css/ManufactoringProcessPage.css';
import { useLocation, useNavigate } from 'react-router-dom';
import { UserRole } from '../types/enums';
import {
    userRegister,
    refreshRegistrationState,
    userLogout
} from '../redux/actions/authAction';

const { Text, Title, Paragraph } = Typography;
const { Option } = AntdSelect;

export default function ManufactoringProcessPage(props) {
    const dispatch = useDispatch();
    const { logindata } = useSelector((state) => state.auth);
    const [isRegisterModalOpen, setIsRegisterModalOpen] = useState(false);
    const [isLoading, setIsLoading] = useState(false);
    const { suppliers, totalSuppliers: total } = useSelector(
        (state) => state.rfq
    ); // Make sure totalSuppliersCount is in your reducer
    const [selectedCountry, setSelectedCountry] = useState('');
    const [selectIndustry, setSelectIndustry] = useState('');
    const [searchKeyword, setSearchKeyword] = useState('');
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 5;
    const navigate = useNavigate();
    const [currentViewedSupplier, setCurrentViewedSupplier] = useState(null);

    const { registrationData, registrationError, laoding } = useSelector(
        (state) => state.auth
    );
    const registrationEmptyState = {
        name: '',
        company: '',
        email: '',
        password: '',
        phone_number: '',
        industry: '',
        marketing_consent: false
    };
    const errorsEmptyState = {
        name: '',
        company: '',
        email: '',
        password: '',
        phone_number: '',
        industry: '',
        marketing_consent: '',
        country_code: ''
    };
    const [registration, setRegistration] = React.useState({
        ...registrationEmptyState
    });
    const [passwordStrength, setPasswordStrength] = useState('');
    //   const dal = useDal();
    const [errors, setErrors] = React.useState({ ...errorsEmptyState });
    /*const location = `/dashboard/supplier-details/${currentViewedSupplier}` //useLocation();
    const { pathname } = location; */

    const validateForm = () => {
        const newErrors = {};
        if (!registration.name) newErrors.name = 'Name is required.';
        if (!registration.company)
            newErrors.company = 'Company name is required.';
        if (!registration.email) newErrors.email = 'Email is required.';
        else if (!/\S+@\S+\.\S+/.test(registration.email))
            newErrors.email = 'Invalid email format.';
        if (!registration.password)
            newErrors.password = 'Password is required.';
        if (!registration.phone_number)
            newErrors.phone_number = 'Phone number is required.';
        if (!registration.industry)
            newErrors.industry = 'Industry selection is required.';
        if (!registration.marketing_consent)
            newErrors.marketing_consent =
                'You must agree to terms & conditions.';

        setErrors(newErrors);
        return Object.keys(newErrors).length === 0;
    };

    const registerUser = async (e) => {
        e.preventDefault();
        if (!validateForm()) return;
        const userType = UserRole.CONSUMER;
        try {
            setIsLoading(true);
            dispatch(userRegister(registration, userType));
        } catch (err) {
            // Handle error
        }
    };

    /* if (registrationData) {
       const registrationStatus = registrationData?.status;
       if (!registrationStatus) {
         window.alert(registrationData.message || '');
       } else {
         localStorage.clear();
         dispatch(userLogout());
         if (registrationData?.data?.role_type === UserRole.CONSUMER) {
           navigate('/consumer-login')
         }
         else if (registrationData?.data?.role_type === UserRole.SUPPLIER) {
           navigate('/supplier-login')
         }
       }
   
       setTimeout(() => {
         dispatch(refreshRegistrationState());
       }, 1000); // Dispatches after 1 second
     }
     */
    useEffect(() => {
        if (registrationData) {
            const registrationStatus = registrationData?.status;
            if (!registrationStatus) {
                window.alert(registrationData.message || '');
            } else {
                setIsLoading(false);
                localStorage.clear();
                dispatch(userLogout());
                notification.success({
                    message:
                        'Registration Successful. Please check your email for verification.',
                    placement: 'topRight'
                });
                navigate(
                    registrationData?.data?.role_type === UserRole.CONSUMER
                        ? '/consumer-login'
                        : '/supplier-login',
                    { state: { from: `/dashboard/supplier-details/${currentViewedSupplier}` } }
                );
            }

            const timer = setTimeout(() => {
                dispatch(refreshRegistrationState());
            }, 1000);

            return () => clearTimeout(timer);
        }
    }, [registrationData]);

    if (registrationError) {
    }

    const getPasswordStrength = (password) => {
        let strength = 0;
        if (password.length >= 8) strength++;
        if (/[A-Z]/.test(password)) strength++;
        if (/[a-z]/.test(password)) strength++;
        if (/\d/.test(password)) strength++;
        if (/[\W_]/.test(password)) strength++;

        if (strength <= 2) return 'Weak';
        if (strength === 3 || strength === 4) return 'Strong';
        return 'Very Strong';
    };

    const handleViewDetails = (id) => {
       // console.log('@@logindata', logindata);
        if (!logindata || !logindata?.data) {
            setIsRegisterModalOpen(true);
            setCurrentViewedSupplier(id);
        } else {
           window.open(`/dashboard/supplier-details/${id}`, '_blank');
        }
    };

    const fetchSuppliers = async (page = 1, reset = false) => {
        setIsLoading(true);
        try {
            await dispatch(
                reset
                    ? getSuppliersList({
                          country: '',
                          industry: '',
                          search: '',
                          pageno: 1,
                          limit: itemsPerPage
                      })
                    : getSuppliersList({
                          country: selectedCountry || '',
                          industry: selectIndustry || '',
                          search: searchKeyword || '',
                          pageno: page,
                          limit: itemsPerPage
                      })
            );
        } catch (error) {
            console.error('Error fetching suppliers:', error);
        } finally {
            setIsLoading(false);
        }
    };

    useEffect(() => {
        fetchSuppliers(currentPage);
    }, [dispatch, currentPage, selectedCountry, selectIndustry, searchKeyword]);

    const handleSearch = () => {
        setCurrentPage(1);
        fetchSuppliers(1);
    };

    const handleResetSearch = () => {
        setSelectedCountry('');
        setSelectIndustry('');
        setSearchKeyword('');
        setCurrentPage(1);
        fetchSuppliers(1, true);
    };

    const handlePageChange = (page) => {
        setCurrentPage(page);
        fetchSuppliers(page);
    };

    console.log('suppliers', suppliers);
    console.log('total', total);

    return (
        <>
           {props?.view !== 'dashboard' && <TopNavigation />}
            {isLoading && (
                <div className="overlay-loader">
                    <div className="spinner" />
                </div>
            )}
            <div style={{ padding: 24, maxWidth: 1200, margin: '0 auto' }}>
                <Title level={2} style={{ textAlign: 'center' }}>
                    The Best Manufacturers Make Parts Here
                </Title>
                <Paragraph style={{ textAlign: 'center', color: '#46556C' }}>
                    Find the best manufacturer for every part, every time.
                </Paragraph>

                {/* Filters */}
                <Row justify="center" gutter={[16, 16]}>
                    <Col>
                        <AntdSelect
                            showSearch
                            value={selectedCountry}
                            onChange={setSelectedCountry}
                            placeholder="Select a country"
                            style={{ width: 220 }}
                            // filterOption={(input, option) =>
                            //     (option?.children ?? '')
                            //         .toLowerCase()
                            //         .includes(input.toLowerCase())
                            // }
                        >
                            <Option value="">-- Location --</Option>
                            {CountryCodes.map(({ name, flag }) => (
                                <Option key={name} value={name}>
                                    <span>
                                        <img
                                            src={`https://flagcdn.com/w20/${flag}.png`}
                                            alt={flag}
                                            style={{
                                                width: 20,
                                                marginRight: 8
                                            }}
                                        />
                                        {name}
                                    </span>
                                </Option>
                            ))}
                        </AntdSelect>
                    </Col>
                    <Col>
                        <AntdSelect
                            showSearch
                            value={selectIndustry}
                            onChange={setSelectIndustry}
                            placeholder="Select an industry"
                            style={{ width: 220 }}
                            // filterOption={(input, option) =>
                            //     (option?.children ?? '')
                            //         .toLowerCase()
                            //         .includes(input.toLowerCase())
                            // }
                        >
                            <Option value="">-- Industry --</Option>
                            {industriesType.map((industry) => (
                                <Option key={industry} value={industry}>
                                    {industry}
                                </Option>
                            ))}
                        </AntdSelect>
                    </Col>
                    <Col>
                        <AntdInput
                            placeholder="Keywords"
                            prefix={<SearchOutlined />}
                            style={{ width: 200 }}
                            value={searchKeyword}
                            onChange={(e) => setSearchKeyword(e.target.value)}
                        />
                    </Col>
                    {/* <Col>
                        <Button type="primary" onClick={handleSearch}>
                            Search Manufacturers
                        </Button>
                    </Col> */}
                </Row>

                {/* Show Near Me */}
                <div
                    style={{
                        textAlign: 'center',
                        margin: '30px auto',
                        //border: '1px solid #eee',
                        //borderRadius: 8,
                        padding: 2,
                        maxWidth: 400
                    }}
                >
                    {/* <Text style={{ display: 'block', marginBottom: 10 }}>
                        Show manufacturers closest to your location listed
                        first.
                    </Text>
                    <Button type="primary">Show Near Me</Button> */}
                </div>

                {/* Filters Display */}
                {selectIndustry && (
                    <Row justify="center" style={{ marginBottom: 10 }}>
                        <Text>Industry:</Text>
                        <Tag
                            style={{
                                marginLeft: 8,
                                backgroundColor: '#E7E7E7',
                                borderRadius: 20
                            }}
                        >
                            {selectIndustry}
                        </Tag>
                    </Row>
                )}
                {selectedCountry && (
                    <Row justify="center" style={{ marginBottom: 10 }}>
                        <Text>Manufacturing Location:</Text>
                        <Tag
                            style={{
                                marginLeft: 8,
                                backgroundColor: '#E7E7E7',
                                borderRadius: 20
                            }}
                        >
                            {selectedCountry}
                        </Tag>
                    </Row>
                )}
                {searchKeyword && (
                    <Row justify="center" style={{ marginBottom: 10 }}>
                        <Text>Search Keyword:</Text>
                        <Tag
                            style={{
                                marginLeft: 8,
                                backgroundColor: '#E7E7E7',
                                borderRadius: 20
                            }}
                        >
                            {searchKeyword}
                        </Tag>
                    </Row>
                )}
                {(searchKeyword || selectedCountry || selectIndustry) && (
                    <Row justify="center" style={{ marginBottom: 30 }}>
                        <Button
                            size="small"
                            style={{
                                backgroundColor: '#6C757D',
                                color: 'white'
                            }}
                            onClick={handleResetSearch}
                        >
                            Reset Search
                        </Button>
                    </Row>
                )}

                {/* Sort */}
                <div
                    style={{
                        display: 'flex',
                        justifyContent: 'flex-end',
                        marginBottom: 20
                    }}
                >
                    <Text style={{ marginRight: 10 }}>Sort by:</Text>
                    <AntdSelect defaultValue="Relevance" style={{ width: 120 }}>
                        <Option value="Relevance">Relevance</Option>
                        <Option value="Rating">Rating</Option>
                    </AntdSelect>
                </div>

                {/* Supplier Cards */}
                <Row gutter={[20, 20]}>
                    {suppliers?.map((mfg) => (
                        <Col key={mfg.id} xs={24} md={12}>
                            <Card
                                bordered
                                style={{
                                    borderRadius: 10,
                                    boxShadow: '0 2px 8px rgba(0,0,0,0.05)'
                                }}
                            >
                                {/* Header Row */}
                                <div
                                    style={{
                                        display: 'flex',
                                        justifyContent: 'space-between',
                                        alignItems: 'flex-start'
                                    }}
                                >
                                    <div
                                        style={{
                                            display: 'flex',
                                            justifyContent: 'space-between',
                                            alignItems: 'center',
                                            spaceBetween: 10,
                                            textTransform: 'capitalize'
                                        }}
                                    >
                                        <Title
                                            level={5}
                                            style={{ marginBottom: 0 }}
                                        >
                                            {mfg.company_type}
                                        </Title>
                                        {/* <Text style={{ color: '#555' }}>
                                            {mfg.rating
                                                ? `⭐ ${mfg.rating.toFixed(
                                                      2
                                                  )} (${mfg.reviews})`
                                                : `⭐ 4.00 (${
                                                      Math.floor(
                                                          Math.random() * 100
                                                      ) + 1
                                                  })`}
                                        </Text> */}
                                    </div>
                                    {/* Placeholder thumbnails (replace src with actual URLs if available) */}
                                    <div style={{ display: 'flex', gap: 4 }}>
                                        {/* {[1, 2, 3].map((_, idx) => (
                                            <img
                                                key={idx}
                                                src={
                                                    mfg
                                                        .core_product_photos?.[
                                                        idx
                                                    ] ||
                                                    'https://via.placeholder.com/40'
                                                }
                                                alt="Thumb"
                                                style={{
                                                    width: 40,
                                                    height: 40,
                                                    objectFit: 'cover',
                                                    borderRadius: 4
                                                }}
                                            />
                                        ))} */}
                                        {mfg?.core_product_photos &&
                                            JSON.parse(
                                                mfg?.core_product_photos
                                            )?.map((row, idx) => {
                                                return (
                                                    <img
                                                        key={idx}
                                                        style={{
                                                            width: 40,
                                                            height: 40,
                                                            objectFit: 'cover',
                                                            borderRadius: 4
                                                        }}
                                                        src={`${API_URL}/${row}`}
                                                        alt="thumb"
                                                    />
                                                );
                                            })}
                                    </div>
                                </div>

                                <Text
                                    type="secondary"
                                    style={{
                                        display: 'block',
                                        overflow: 'hidden',
                                        textOverflow: 'ellipsis',
                                        whiteSpace: 'nowrap',
                                        maxWidth: '100%'
                                    }}
                                >
                                    {mfg.about_us}
                                </Text>

                                {/* Subtext */}
                                <Text
                                    type="secondary"
                                    style={{
                                        display: 'block',
                                        marginBottom: 8,
                                        color: '#888'
                                    }}
                                >
                                    Supplier Id - {mfg?.member_id } |{' '}
                                    📍{mfg.location || ' India'} |{' '}
                                    {mfg.industry ||
                                        'Job Shop / Contract Manufacturer'}{' '}
                                    | {mfg.capacity || '50–99'} |{' '}
                                    {mfg.operating_days || 'NA'}
                                </Text>
                                {/* Description */}
                                <Paragraph
                                    ellipsis={{ rows: 2 }}
                                    style={{ marginBottom: 12 }}
                                >
                                    {mfg.description}{' '}
                                    <a href="#">+ Read More</a>
                                </Paragraph>

                                {/* Tags */}
                                <div style={{ marginBottom: 10 }}>
                                    {mfg.tags?.slice(0, 6).map((tag, idx) => (
                                        <Tag
                                            key={idx}
                                            style={{ marginBottom: 6 }}
                                        >
                                            {tag}
                                        </Tag>
                                    ))}
                                    {mfg.tags?.length > 6 && (
                                        <Tag style={{ background: '#e7e7e7' }}>
                                            + More
                                        </Tag>
                                    )}
                                </div>

                                {/* Badges */}
                               <div style={{ marginBottom: 10 }}>
                                {mfg.mpid &&
                                  mfg.mpid
                                    .split(',')
                                    .slice(0, 3)
                                    .map((badge, idx) => (
                                      <Tag
                                        key={idx}
                                        color="gray"
                                        style={{ marginBottom: 6 }}
                                      >
                                        {badge.trim()}
                                      </Tag>
                                    ))}
                              </div>


                                {/* Footer */}
                                <div
                                    style={{
                                        display: 'flex',
                                        justifyContent: 'space-between',
                                        alignItems: 'center'
                                    }}
                                >
                                    <Button
                                        type="primary"
                                        onClick={() => handleViewDetails(mfg.id)}
                                    >
                                        View More Details
                                    </Button>

                                    {/* Optional Compare checkbox - uncomment if needed */}
                                    {/* 
                                <label>
                                  <input type="checkbox" style={{ marginRight: 6 }} />
                                  Compare
                                </label> 
                                */}
                                </div>
                            </Card>
                        </Col>
                    ))}
                </Row>

                {/* Pagination */}
                { suppliers?.length > 0 ? (
                <Row justify="center" style={{ marginTop: 30 }}>
                    <Pagination
                        current={currentPage}
                        pageSize={itemsPerPage}
                        total={total || 0}
                        onChange={handlePageChange}
                        showSizeChanger={false}
                    />
                </Row>): <Row justify="center" style={{ marginTop: 2, fontSize: '18px', fontWeight: 'normal'}}>No Search Result !, Please try with other combinations</Row>}
                <Modal
                    //title="Register to View Details"
                    open={isRegisterModalOpen}
                    onCancel={() => setIsRegisterModalOpen(false)}
                    footer={null}
                    centered
                >
                    <FormContainer>
                        <h2 style={{ marginBottom: '2px', color: '#1F2937' }}>
                            Sign up for an account
                        </h2>
                        <form onSubmit={registerUser}>
                            {/* Name */}
                            <InputField>
                                <Label style={{ marginBottom: '3px' }}>
                                    Name *
                                </Label>
                                <Input
                                    type="text"
                                    placeholder="Your name"
                                    required
                                    onChange={(e) =>
                                        setRegistration({
                                            ...registration,
                                            name: e.target.value
                                        })
                                    }
                                    style={{
                                        padding: '0.75rem',
                                        borderRadius: '5px',
                                        border: '1px solid #1A3E8A',
                                        fontSize: '13px',
                                        backgroundColor: '#f9fafb',
                                        color: '#333',
                                        height: '36px'
                                        //marginBottom: "5px"
                                    }}
                                />
                                {errors.name && <Error>{errors.name}</Error>}
                            </InputField>

                            {/* Company */}
                            <InputField>
                                <Label>Company *</Label>
                                <Input
                                    type="text"
                                    placeholder="Company name"
                                    required
                                    onChange={(e) =>
                                        setRegistration({
                                            ...registration,
                                            company: e.target.value
                                        })
                                    }
                                    style={{
                                        padding: '0.75rem',
                                        borderRadius: '5px',
                                        border: '1px solid #1A3E8A',
                                        fontSize: '13px',
                                        backgroundColor: '#f9fafb',
                                        color: '#333',
                                        height: '38px'
                                        //marginBottom: "8px"
                                    }}
                                />
                                {errors.company && (
                                    <Error>{errors.company}</Error>
                                )}
                            </InputField>

                            {/* Email */}
                            <InputField>
                                <Label>Email *</Label>
                                <Input
                                    type="email"
                                    placeholder="Company email"
                                    required
                                    onChange={(e) =>
                                        setRegistration({
                                            ...registration,
                                            email: e.target.value
                                        })
                                    }
                                    style={{
                                        padding: '0.75rem',
                                        borderRadius: '5px',
                                        border: '1px solid #1A3E8A',
                                        fontSize: '13px',
                                        backgroundColor: '#f9fafb',
                                        color: '#333',
                                        height: '38px'
                                        //marginBottom: "8px"
                                    }}
                                />
                                {errors.email && <Error>{errors.email}</Error>}
                            </InputField>

                            {/* Password */}
                            <InputField>
                                <div
                                    style={{
                                        display: 'flex',
                                        justifyContent: 'space-between',
                                        alignItems: 'center'
                                    }}
                                >
                                    <Label>Password *</Label>
                                    {registration.password && (
                                        <span
                                            style={{
                                                fontSize: '12px',
                                                fontWeight: 'semibold',
                                                color:
                                                    passwordStrength === 'Weak'
                                                        ? 'red'
                                                        : passwordStrength ===
                                                          'Strong'
                                                        ? 'orange'
                                                        : 'green'
                                            }}
                                        >
                                            {passwordStrength}
                                        </span>
                                    )}
                                </div>
                                <Input
                                    type="password"
                                    placeholder="Password"
                                    required
                                    pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$"
                                    title="Password must be at least 8 characters, and include uppercase, lowercase, number, and special character."
                                    //onChange={(e) => setRegistration({ ...registration, password: e.target.value })}
                                    onChange={(e) => {
                                        const newPassword = e.target.value;
                                        setRegistration({
                                            ...registration,
                                            password: newPassword
                                        });
                                        setPasswordStrength(
                                            getPasswordStrength(newPassword)
                                        );
                                    }}
                                    style={{
                                        padding: '0.75rem',
                                        borderRadius: '5px',
                                        border: '1px solid #1A3E8A',
                                        fontSize: '13px',
                                        backgroundColor: '#f9fafb',
                                        color: '#333',
                                        height: '38px'
                                        //marginBottom: "8px"
                                    }}
                                />
                                {errors.password && (
                                    <Error>{errors.password}</Error>
                                )}
                            </InputField>

                            <InputField>
                                <Label>Location *</Label>
                                <PhoneContainer>
                                    <Select
                                        //onChange={(e) => setRegistration({ ...registration, country_code: e.target?.value?.split('@@')?.[0], country: e.target.value?.split('@@')?.[1] })}
                                        onChange={(e) => {
                                            console.log(
                                                'e.target.value',
                                                e.target
                                            );
                                        }}
                                        style={{
                                            borderRadius: '5px',
                                            border: '1px solid #1A3E8A',
                                            fontSize: '13px',
                                            backgroundColor: '#f9fafb',
                                            color: '#333',
                                            height: '38px',
                                            width: '60%',
                                            marginRight: '2%'
                                        }}
                                    >
                                        <option value="">Country</option>
                                        {CountryCodes.map((country, index) => (
                                            <option
                                                key={index}
                                                value={`${country.code}@@${country.name}`}
                                            >
                                                {country.name}
                                            </option>
                                        ))}
                                    </Select>
                                    <Input
                                        type="text"
                                        placeholder="State"
                                        required
                                        onChange={(e) =>
                                            setRegistration({
                                                ...registration,
                                                state: e.target.value
                                            })
                                        }
                                        style={{
                                            padding: '0.75rem',
                                            borderRadius: '5px',
                                            border: '1px solid #1A3E8A',
                                            fontSize: '13px',
                                            backgroundColor: '#f9fafb',
                                            color: '#333',
                                            height: '38px'
                                        }}
                                    />
                                </PhoneContainer>
                                {errors.country && (
                                    <Error>{errors.country}</Error>
                                )}
                                {errors.state && <Error>{errors.state}</Error>}
                            </InputField>
                            {/* Phone Number with Country Code */}
                            <InputField>
                                <Label>Phone number with Country Code *</Label>
                                <PhoneContainer>
                                    {/* <Select
                                 onChange={(e) => setRegistration({ ...registration, country_code: e.target.value })}
                                 style={{
                                   borderRadius: '5px',
                                   border: '1px solid #1A3E8A',
                                   fontSize: '13px',
                                   backgroundColor: '#f9fafb',
                                   color: '#333',
                                   height: '38px',
                                   width:'30%',
                                   }}
                               >
                                 <option value="">Code</option>
                                 {CountryCodes.map((country, index) => (
                                   <option key={index} value={country.code}>
                                     {country.name} ({country.code})
                                   </option>
                                 ))}
                               </Select> */}
                                    <Input
                                        type="text"
                                        placeholder="Phone number with Country Code"
                                        required
                                        onChange={(e) =>
                                            setRegistration({
                                                ...registration,
                                                phone_number: e.target.value
                                            })
                                        }
                                        style={{
                                            padding: '0.75rem',
                                            borderRadius: '5px',
                                            border: '1px solid #1A3E8A',
                                            fontSize: '13px',
                                            backgroundColor: '#f9fafb',
                                            color: '#333',
                                            height: '38px'
                                        }}
                                    />
                                </PhoneContainer>
                                {errors.country_code && (
                                    <Error>{errors.country_code}</Error>
                                )}
                                {errors.phone_number && (
                                    <Error>{errors.phone_number}</Error>
                                )}
                            </InputField>

                            {/* Industry */}
                            <InputField>
                                <Label>Industry</Label>
                                <Select
                                    onChange={(e) =>
                                        setRegistration({
                                            ...registration,
                                            industry: e.target.value
                                        })
                                    }
                                    style={{
                                        //padding: '0.75rem',
                                        borderRadius: '5px',
                                        border: '1px solid #1A3E8A',
                                        fontSize: '13px',
                                        backgroundColor: '#f9fafb',
                                        color: '#333',
                                        height: '38px'
                                        //marginBottom: "8px"
                                    }}
                                >
                                    <option value="">Select</option>
                                    {industriesType.map((type, index) => (
                                        <option key={index} value={type}>
                                            {type}
                                        </option>
                                    ))}
                                </Select>
                                {errors.industry && (
                                    <Error>{errors.industry}</Error>
                                )}
                            </InputField>

                            {/* Agreement */}
                            <Agreement>
                                <Checkbox
                                    id="marketing_consent"
                                    type="checkbox"
                                    required
                                    checked={registration.marketing_consent}
                                    onChange={(e) =>
                                        setRegistration({
                                            ...registration,
                                            marketing_consent: e.target.checked
                                        })
                                    }
                                    style={{
                                        width: '16px',
                                        height: '16px',
                                        cursor: 'pointer'
                                    }}
                                />
                                <Label
                                    htmlFor="marketing_consent"
                                    style={{
                                        cursor: 'pointer',
                                        marginBottom: '0rem'
                                    }}
                                >
                                    I agree to the{' '}
                                </Label>
                                <Label
                                    onClick={() =>
                                        navigate('/terms-conditions')
                                    }
                                    style={{
                                        cursor: 'pointer',
                                        color: '#2563EB',
                                        marginBottom: '0rem',
                                        textDecoration: 'underline',
                                        paddingLeft: '4px',
                                        textUnderlineOffset: '2px'
                                    }}
                                >
                                    terms & conditions
                                </Label>
                            </Agreement>
                            {isLoading && <Spinner />}
                            <SubmitButton type="submit" disabled={isLoading}>
                                {isLoading
                                    ? 'Sign up In progress...'
                                    : 'Sign up'}
                            </SubmitButton>
                        </form>

                        <LoginLink>
                            <span style={{ color: '#4b5563' }}>
                                Already have an account?{' '}
                            </span>
                            <span
                                onClick={() =>
                                    navigate('/consumer-login',  { state: { from: `/dashboard/supplier-details/${currentViewedSupplier}` } }
                                    )
                                }
                            >
                                <span
                                    style={{
                                        fontSize: '14px',
                                        color: '#2563EB',
                                        cursor: 'pointer',
                                    }}
                                >
                                    Login
                                </span>
                            </span>
                        </LoginLink>
                    </FormContainer>
                </Modal>
            </div>
            {props?.view !== 'dashboard' && <Footer />}
        </>
    );
}

const InputField = styled.div`
    margin-bottom: .5rem;
`;

const Label = styled.label`
    font-size: 0.875rem;
    color: #4b5563;
    margin-bottom: 0.25rem;
`;

const Input = styled.input`
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
    background-color: #f9fafb;
`;

const Select = styled.select`
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
    background-color: #f9fafb;
`;

const PhoneContainer = styled.div`
    display: flex;
`;

const Checkbox = styled.input`
    margin-right: 0.5rem;
`;

const Agreement = styled.div`
    display: flex;
    align-items: center;
    margin-top: .2rem;
    margin-bottom: .2rem;
`;

const Error = styled.div`
    color: #d9534f;
    font-size: 0.875rem;
    margin-top: 0.25rem;
`;

const SubmitButton = styled.button`
    width: 100%;
    padding: 8px 0px;
    background-color: #2563eb;
    color: white;
    font-size: 14px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    height: 34px;
`;

const LoginLink = styled.p`
    font-size: 0.875rem;
    color: #6b7280;
    margin-top: .2rem;
    text-align: center;
`;

const spin = keyframes`
  to { transform: rotate(360deg); }
`;

const Spinner = styled.div`
    border: 2px solid blue;
    border-top: 2px solid transparent;
    border-radius: 50%;
    width: 18px;
    height: 18px;
    animation: ${spin} 0.8s linear infinite;
    padding: 2px;
`;

const FormContainer = styled.div`
    background: #fff;
    padding: 1rem 1.5rem;
    border-radius: 10px;
    //box-shadow: 0 2px 16px rgba(0, 0, 0, 0.07);
    max-width: 420px;
    margin: 0 auto;
`;
