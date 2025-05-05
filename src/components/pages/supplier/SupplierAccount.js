import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import {
    Form,
    Input,
    Select,
    Upload,
    Button,
    message,
    Row,
    Col,
    Typography,
    Modal,
    Image,
    Divider,
    Space,
    Tag
} from 'antd';
import { updateAccount, getUserInfo } from '../../../redux/actions/userActions';
import { UploadOutlined, EyeOutlined, PlusOutlined } from '@ant-design/icons';
import {
    CountryCodes,
    industriesType
} from './../../../components/Registration/constants';
import FilePreview from '../../../components/FilePreview';
import FilePreviewMultiple from '../../../components/FilePreviewMultiple';

const { Option } = Select;

const { Title, Text } = Typography;

const SupplierAccount = () => {
    const dispatch = useDispatch();
    const [form] = Form.useForm();
    const [loading, setLoading] = useState(false);
    const token = useSelector((state) => state.auth.logindata.token);
    const manufacturingProcess = useSelector(
        (state) => state.auth.logindata.manufacturing_process
    );
    const accountUpdateStatus = useSelector(
        (state) => state.user.accountUpdateStatus
    );
    const userDetail = useSelector((state) => state.user.userDetail);
    const [isModalVisible, setIsModalVisible] = useState(false);

    const fileRootPath = 'https://factory.demosite.name/api';
    const [formData, setFormData] = useState({
        employeeCount: 0,
        facilities: '',
        location: '',
        files: []
    });

    const onFinish = (values) => {
        // console.log('values', values);
        // console.log('formData', formData);
        //return;
        const getValidFile = (files) => {
            if (Array.isArray(files)) {
                return files.length > 0 ? files[0] : null;
            } else if (files && typeof files === 'object') {
                return files;
            }
            return null;
        };

        //setLoading(true);
        const dataToSend = {
            ...values,
            employeeCount: values.employeeCount,
            facilities: values.facilities,
            location: values.location,
            iso_certification: values.iso_certification,
            freezone: values.freezone,
            manufacturing_process: values?.manufacturing_process?.join(','),
            services: values?.services?.join(','),
            operating_days: values?.operating_days
                ? values?.operating_days?.join(',')
                : '',
            machinery_list:
                values.machinery_list?.map((machine, index) => {
                    return {
                        ...machine,
                        machine_photos: formData.machine_photos
                            ? formData.machine_photos[index]
                            : null // Assign photo or null if no photo
                    };
                }) || [],
            // files: formData.importExportDocs?.[0] ?? null,
            // company_logo: Array.isArray(formData.company_logo) ? formData.company_logo?.[0] : formData.company_logo ?? null,
            // company_portflio:  Array.isArray(formData.company_portflio) ? formData.company_portflio?.[0]  : formData.company_portflio ?? null,
            // certificate: formData.certificate?.[0] ?? null,
            // import_export_document: formData.import_export_document?.[0] ?? null,
            //files: getValidFile(formData.importExportDocs),
            //company_logo:  Array.isArray(formData.company_logo) ? values.company_logo[1] : getValidFile(values.company_logo),
            //company_portflio: Array.isArray(formData.company_portflio) ? values.company_portflio[1] : getValidFile(values.company_portflio),
            //certificate: Array.isArray(formData.certificate) ? values.certificate[1] : getValidFile(values.certificate),
            //import_export_document: Array.isArray(formData.import_export_document) ? values.import_export_document[1] : getValidFile(values.import_export_document),
            company_logo: Array.isArray(formData.company_logo)
                ? formData.company_logo.at(-1)
                : formData.company_logo ?? null,
            company_portflio: Array.isArray(formData.company_portflio)
                ? formData.company_portflio.at(-1)
                : formData.company_portflio ?? null,
            certificate: Array.isArray(formData.certificate)
                ? formData.certificate.at(-1)
                : formData.certificate ?? null,
            import_export_document: Array.isArray(
                formData.import_export_document
            )
                ? formData.import_export_document.at(-1)
                : formData.import_export_document ?? null,

            production_facility_photos: Array.isArray(
                formData.production_facility_photos
            )
                ? formData.production_facility_photos.at(-1)
                : formData.production_facility_photos ?? null,

            production_line_photos: Array.isArray(
                formData.production_line_photos
            )
                ? formData.production_line_photos.at(-1)
                : formData.production_line_photos ?? null,

            qc_area_photos: Array.isArray(formData.qc_area_photos)
                ? formData.qc_area_photos.at(-1)
                : formData.qc_area_photos ?? null,

            warehouse_photos: Array.isArray(formData.warehouse_photos)
                ? formData.warehouse_photos.at(-1)
                : formData.warehouse_photos ?? null,

            environmental_cert_upload: Array.isArray(
                formData.environmental_cert_upload
            )
                ? formData.environmental_cert_upload.at(-1)
                : formData.environmental_cert_upload ?? null,

            social_compliance_upload: Array.isArray(
                formData.social_compliance_upload
            )
                ? formData.social_compliance_upload.at(-1)
                : formData.social_compliance_upload ?? null,

            core_product_photos: formData?.core_product_photos
        };
        //delete dataToSend.importExportDocs;
        //console.log('dataToSend', dataToSend);
        setFormData(dataToSend);
        dispatch(updateAccount(dataToSend, token));
        setTimeout(() => {
            dispatch(getUserInfo(token));
        }, [1000]);
    };

    //console.log("@@formData=>", formData);
    const handleFileUpload = async (file, fieldKey) => {
        const formData = new FormData();
        formData.append('upload[0]', file);

        try {
            const response = await fetch(
                'https://factory.demosite.name/api/Api/multipleDocUpload',
                {
                    method: 'POST',
                    headers: {
                        Authorization: `Bearer ${token}`
                    },
                    body: formData
                }
            );

            const result = await response.json();
            if (response.ok) {
                message.success(`${file.name} file uploaded successfully`);
                // setFormData(prevState => {
                //   return { ...prevState, [fieldKey]: [...prevState?.files, result[0]]};
                // });
                setFormData((prevState) => {
                    return {
                        ...prevState,
                        [fieldKey]: [
                            ...(prevState?.[fieldKey] || []),
                            result[0]
                        ]
                    };
                });
            } else {
                message.error(`${file.name} file upload failed.`);
            }
        } catch (error) {
            message.error(`${file.name} file upload failed.`);
        }
    };

    const props = (fieldKey) => ({
        name: 'file',
        customRequest: ({ file, onSuccess }) => {
            handleFileUpload(file, fieldKey);
            onSuccess('ok');
        }
    });

    useEffect(() => {
        // Set the form's initial values when formData changes
        form.setFieldsValue({
            employeeCount: formData?.employeeCount
                ? parseInt(formData.employeeCount, 10)
                : 0,
            facilities: formData.facilities,
            location: formData.location,
            iso_certification: formData.iso_certification,
            freezone: formData.freezone,
            manufacturing_process: formData?.manufacturing_process,
            files: formData?.files?.[0],

            about_us: formData?.about_us || '',
            address: formData?.address || '',
            anual_turnover: formData?.anual_turnover || '',
            certificate: formData?.certificate || '',
            company: formData?.company || '',
            company_logo: formData?.company_logo || '',
            company_portflio: formData?.company_portflio || '',
            import_export_document: formData?.import_export_document || '',
            company_type: formData?.company_type || '',
            company_website: formData?.company_website || '',
            contact: formData?.contact || '',
            gst_no: formData?.gst_no || '',
            industry: formData?.industry || '',
            key_customers: formData?.key_customers || '',
            past_project: formData?.past_project || '',
            urn: formData?.urn || '',
            services: formData?.services || '',
            //import_export_document: formData?.import_export_document || [],
            year_of_establishment: formData?.year_of_establishment || '',
            iec_code: formData?.iec_code || '',

            mobile_phone: formData?.mobile_phone || '',
            company_email: formData?.company_email || '',
            alt_contact_phone: formData?.alt_contact_phone || '',
            office_address: formData?.office_address || '',
            factory_address: formData?.factory_address || '',
            shipping_address: formData?.shipping_address || '',
            postal_code: formData?.postal_code || '',
            bank_details: formData?.bank_details || '',
            payment_terms: formData?.payment_terms || '',
            //tax_documents: formData?.tax_documents || [],
            machinery_list: formData?.machinery_list || [],
            operating_days: formData?.operating_days
                ? formData?.operating_days.split(',')
                : [],
            general_moq_policy: formData?.general_moq_policy || '',
            sample_order_moq: formData?.sample_order_moq || '',
            production_order_moq: formData?.production_order_moq || '',

            quality_control_process: formData?.quality_control_process || '',
            testing_capabilities: formData?.testing_capabilities || '',
            export_markets: formData?.export_markets || '',
            years_in_export: formData?.years_in_export || '',
            average_lead_time: formData?.average_lead_time || '',
            environmental_cert_text: formData?.environmental_cert_text || '',
            social_compliance_text: formData?.social_compliance_text || '',
            sustainable_practices: formData?.sustainable_practices || '',

            production_facility_photos:
                formData?.production_facility_photos || '',
            production_line_photos: formData?.production_line_photos || '',
            qc_area_photos: formData?.qc_area_photos || '',
            warehouse_photos: formData?.warehouse_photos || '',

            environmental_cert_upload:
                formData?.environmental_cert_upload || '',
            social_compliance_upload: formData?.social_compliance_upload || '',
            core_product_photos: formData?.core_product_photos || []
        });
    }, [formData, form]);

    useEffect(() => {
        if (accountUpdateStatus) {
            dispatch(getUserInfo(token));
        }
    }, [accountUpdateStatus, dispatch, token]);

    useEffect(() => {
        dispatch(getUserInfo(token));
    }, [token]);

    useEffect(() => {
        if (userDetail) {
            setFormData({
                employeeCount: userDetail?.employeeCount || 0,
                facilities: userDetail?.facilities || '',
                location: userDetail?.location || '',
                iso_certification: userDetail?.iso_certification || '',
                freezone: userDetail.freezone,
                manufacturing_process:
                    userDetail.manufacturing_process?.split(','),
                files: userDetail?.files || [],
                about_us: userDetail?.about_us || '',
                address: userDetail?.address || '',
                anual_turnover: userDetail?.anual_turnover || '',
                certificate: userDetail?.certificate || '',
                company: userDetail?.company || '',
                company_logo: userDetail?.company_logo || null,
                company_portflio: userDetail?.company_portflio || null,
                certificate: userDetail?.certificate || null,
                import_export_document:
                    userDetail?.import_export_document || null,
                company_type: userDetail?.company_type || '',
                company_website: userDetail?.company_website || '',
                contact: userDetail?.contact || '',
                gst_no: userDetail?.gst_no || '',
                industry: userDetail?.industry || '',
                key_customers: userDetail?.key_customers || '',
                past_project: userDetail?.past_project || '',
                urn: userDetail?.urn || '',
                services: userDetail.services?.split(','),
                //import_export_document: userDetail?.import_export_document || [],
                year_of_establishment: userDetail?.year_of_establishment || '',
                iec_code: userDetail?.iec_code || '',

                mobile_phone: userDetail?.mobile_phone || '',
                company_email: userDetail?.company_email || '',
                alt_contact_phone: userDetail?.alt_contact_phone || '',
                office_address: userDetail?.office_address || '',
                factory_address: userDetail?.factory_address || '',
                shipping_address: userDetail?.shipping_address || '',
                postal_code: userDetail?.postal_code || '',
                bank_details: userDetail?.bank_details || '',
                payment_terms: userDetail?.payment_terms || '',
                // tax_documents: userDetail?.tax_documents || [],
                machinery_list: userDetail?.machinery_list
                    ? JSON.parse(userDetail?.machinery_list)
                    : [],
                operating_days: userDetail?.operating_days || '',

                general_moq_policy: userDetail?.general_moq_policy || '',
                sample_order_moq: userDetail?.sample_order_moq || '',
                production_order_moq: userDetail?.production_order_moq || '',

                quality_control_process:
                    userDetail?.quality_control_process || '',
                testing_capabilities: userDetail?.testing_capabilities || '',

                export_markets: userDetail?.export_markets || '',
                years_in_export: userDetail?.years_in_export || '',
                average_lead_time: userDetail?.average_lead_time || '',
                environmental_cert_text:
                    userDetail?.environmental_cert_text || '',
                social_compliance_text:
                    userDetail?.social_compliance_text || '',
                sustainable_practices: userDetail?.sustainable_practices || [],

                production_facility_photos:
                    userDetail?.production_facility_photos || null,
                production_line_photos:
                    userDetail?.production_line_photos || null,
                qc_area_photos: userDetail?.qc_area_photos || null,
                warehouse_photos: userDetail?.warehouse_photos || null,

                environmental_cert_upload:
                    userDetail?.environmental_cert_upload || null,

                social_compliance_upload:
                    userDetail?.social_compliance_upload || null,

                core_product_photos: userDetail?.core_product_photos
                    ? JSON.parse(userDetail?.core_product_photos)
                    : []
            });
        }
    }, [userDetail]);

    //console.log("@@manufacturingProcess", manufacturingProcess);
    return (
        <>
            <div
                style={{
                    maxWidth: '1200px',
                    background: '#fff',
                    borderRadius: 8,
                    padding: 24
                }}
            >
                <h1
                    style={{
                        display: 'flex',
                        alignItems: 'center',
                        justifyContent: 'space-between',
                        marginBottom: '20px'
                    }}
                >
                    Factory Profile
                    <a href='/dashboard/supplier-details' target='_blank' >
                         <Button
                        type="primary"
                        icon={<EyeOutlined />}
                        //onClick={() => setIsModalVisible(true)}
                    >
                        Preview
                    </Button>
                    </a>
                   
                </h1>
                <Form layout="vertical" onFinish={onFinish} form={form}>
                    <Row gutter={16}>
                        <Col span={12}>
                            <Form.Item
                                name="company_logo"
                                label="Company Logo"
                                valuePropName="file"
                            >
                                <Upload
                                    {...props('company_logo')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Logo
                                    </Button>
                                </Upload>
                                {formData?.company_logo && (
                                    <FilePreview
                                        filePath={formData?.company_logo}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="company_portflio"
                                label="Company Portfolio"
                                valuePropName="file"
                            >
                                <Upload
                                    {...props('company_portflio')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Logo
                                    </Button>
                                </Upload>
                                {formData?.company_portflio && (
                                    <FilePreview
                                        filePath={formData?.company_portflio}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="certificate"
                                label="Certificate"
                                valuePropName="file"
                            >
                                <Upload
                                    {...props('certificate')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Certificate
                                    </Button>
                                    {formData?.certificate && (
                                        <FilePreview
                                            filePath={formData?.certificate}
                                            fileRootPath={fileRootPath}
                                        />
                                    )}
                                </Upload>
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            {/* <Form.Item name="iec_code" label="Import Export Code (IEC)" rules={[{ required: true, message: "Please enter IEC code" }]}> 
      <Input placeholder="Enter IEC code" />
      </Form.Item> */}

                            <Form.Item
                                name="import_export_document"
                                label="Import/Export Documents"
                                //rules={[{ required: true, message: "Please upload a document" }]}
                                valuePropName="file"
                            >
                                <Upload
                                    {...props('import_export_document')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Document
                                    </Button>
                                </Upload>
                                {formData?.import_export_document && (
                                    <FilePreview
                                        filePath={
                                            formData?.import_export_document
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                                {/* {formData?.files} */}
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            {/* ISO Certification */}
                            <Form.Item
                                name="iso_certification"
                                label="ISO Certification"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please select an option'
                                    }
                                ]}
                            >
                                <Select placeholder="Select">
                                    <Option value="1">Yes</Option>
                                    <Option value="0">No</Option>
                                </Select>
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="company"
                                label="Company"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter company name'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter company name" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="company_type"
                                label="Company Type"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter company type'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter company type" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="company_website"
                                label="Company Website"
                            >
                                <Input placeholder="Enter website URL" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="year_of_establishment"
                                label="Year of Establishment"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter year'
                                    }
                                ]}
                            >
                                <Input type="number" placeholder="Enter year" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            {/* Number of Employees */}
                            <Form.Item
                                name="employeeCount"
                                label="Number of Employees"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter employee count'
                                    }
                                ]}
                            >
                                <Input
                                    type="number"
                                    placeholder="Enter the total number of employees"
                                />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="anual_turnover"
                                label="Annual Turnover"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter annual turnover'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter turnover" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="address"
                                label="Address"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter address'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter address" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="contact"
                                label="Contact"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter contact'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter contact details" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="gst_no"
                                label="GST No"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter GST number'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter GST number" />
                            </Form.Item>
                        </Col>

                        <Col span={8}>
                            <Form.Item
                                name="urn"
                                label="Udhyam Registration No (URN)"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please enter URN'
                                    }
                                ]}
                            >
                                <Input placeholder="Enter URN" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="industry"
                                label="Industry"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please select an industry'
                                    }
                                ]}
                            >
                                <Select placeholder="Select industry">
                                    <option value="">Select industry</option>
                                    {industriesType.map((type, index) => (
                                        <option key={index} value={type}>
                                            {type}
                                        </option>
                                    ))}
                                </Select>
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="freezone"
                                label="Freezone"
                                rules={[
                                    {
                                        required: true,
                                        message: 'Please select an option'
                                    }
                                ]}
                            >
                                <Select placeholder="Select">
                                    <Option value="1">Yes</Option>
                                    <Option value="0">No</Option>
                                </Select>
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="operating_days"
                                label="Operating Days"
                            >
                                <Select
                                    mode="multiple"
                                    placeholder="Select operating days"
                                >
                                    <Option value="Mon-Fri">Mon - Fri</Option>
                                    <Option value="Mon-Sat">Mon - Sat</Option>
                                    <Option value="Sat-Thu">
                                        Sat - Thu (Friday Holiday)
                                    </Option>
                                </Select>
                            </Form.Item>
                        </Col>
                        <Col span={8}></Col>
                        <Col span={8}>
                            <Form.Item
                                name="key_customers"
                                label="Key Customers"
                            >
                                <Input.TextArea
                                    placeholder="Enter key customers"
                                    rows={3}
                                />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="past_project"
                                label="Past Projects"
                            >
                                <Input.TextArea
                                    placeholder="Describe past projects"
                                    rows={3}
                                />
                            </Form.Item>
                        </Col>

                        {/* Facilities Available */}
                        {/* <Form.Item
          name="facilities"
          label="Facilities Available"
          rules={[{ required: true, message: "Please describe your facilities" }]}
        >
          <Input.TextArea placeholder="Describe the facilities your company offers" rows={3} />
        </Form.Item> */}

                        <Col span={8}>
                            <Form.Item name="about_us" label="About Us">
                                <Input.TextArea
                                    placeholder="Tell us about yourself"
                                    rows={3}
                                />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="services"
                                label="Services Available"
                                //rules={[{ required: true, message: "Please describe your Services" }]}
                            >
                                <Select
                                    placeholder="Select Services"
                                    mode="multiple"
                                >
                                    <Option value="Manufacturing Processes">
                                        Manufacturing Processes
                                    </Option>
                                    <Option value="Material Capabilities">
                                        Material Capabilities
                                    </Option>
                                    <Option value="Finishing Capabilities">
                                        Finishing Capabilities
                                    </Option>
                                    <Option value="Design Services">
                                        Design Services
                                    </Option>
                                </Select>
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                label="Manufacturing Available"
                                name="manufacturing_process"
                                rules={[
                                    {
                                        required: true,
                                        message:
                                            'Manufacturing process is required!'
                                    }
                                ]}
                            >
                                <Select
                                    placeholder="--Please choose an option--"
                                    mode="multiple"
                                >
                                    {manufacturingProcess.map((process) => (
                                        <Option
                                            key={process.id}
                                            value={process.id}
                                        >
                                            {process.process_name}
                                        </Option>
                                    ))}
                                </Select>
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Contact Information
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="mobile_phone"
                                label="Mobile Phone Number"
                            >
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="company_email"
                                label="Company General Email"
                            >
                                <Input type="email" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="alt_contact_phone"
                                label="Alternative Contact Phone"
                            >
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="office_address"
                                label="Office Address"
                            >
                                <Input.TextArea rows={2} />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="factory_address"
                                label="Factory Address"
                            >
                                <Input.TextArea rows={2} />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="shipping_address"
                                label="Shipping Address"
                            >
                                <Input.TextArea rows={2} />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="postal_code"
                                label="Postal/ZIP Code"
                            >
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Financial Information
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={8}>
                            <Form.Item name="bank_details" label="Bank Details">
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="payment_terms"
                                label="Payment Terms"
                            >
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="tax_documents"
                                label="Tax Documents"
                                valuePropName="fileList"
                                getValueFromEvent={(e) => e.fileList}
                            >
                                <Upload
                                    {...props('tax_documents')}
                                    listType="picture"
                                    multiple
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Documents
                                    </Button>
                                </Upload>
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Machinery & Equipment
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={24}>
                            <Form.Item label="Machinery & Equipment">
                                <Form.List name="machinery_list">
                                    {(fields, { add, remove }) => (
                                        <>
                                            {fields.map(
                                                ({
                                                    key,
                                                    name,
                                                    ...restField
                                                }) => (
                                                    <Row
                                                        gutter={16}
                                                        key={key}
                                                        style={{
                                                            marginBottom: 16
                                                        }}
                                                    >
                                                        <Col span={6}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'name'
                                                                ]}
                                                                label="Machinery Name"
                                                                rules={[
                                                                    {
                                                                        required: true
                                                                    }
                                                                ]}
                                                            >
                                                                <Input />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={3}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'quantity'
                                                                ]}
                                                                label="Qty"
                                                                rules={[
                                                                    {
                                                                        required: true
                                                                    }
                                                                ]}
                                                            >
                                                                <Input type="number" />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={5}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'brand_model'
                                                                ]}
                                                                label="Brand/Model"
                                                            >
                                                                <Input />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={5}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'technical_specifications'
                                                                ]}
                                                                label="Tech Specs"
                                                            >
                                                                <Input.TextArea
                                                                    rows={1}
                                                                />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={5}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'production_capacity'
                                                                ]}
                                                                label="Prod. Capacity"
                                                            >
                                                                <Input />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={24}>
                                                            <Form.Item
                                                                {...restField}
                                                                name={[
                                                                    name,
                                                                    'photos'
                                                                ]}
                                                                label="Machine Photos"
                                                                valuePropName="file"
                                                                getValueFromEvent={(
                                                                    e
                                                                ) => e.file}
                                                            >
                                                                <Upload
                                                                    {...props(
                                                                        'machine_photos'
                                                                    )}
                                                                    listType="picture"
                                                                    multiple
                                                                >
                                                                    <Button
                                                                        icon={
                                                                            <UploadOutlined />
                                                                        }
                                                                    >
                                                                        Upload
                                                                        Photos
                                                                    </Button>
                                                                </Upload>
                                                                <FilePreview
                                                                    key={key}
                                                                    filePath={
                                                                        formData
                                                                            ?.machinery_list?.[
                                                                            name
                                                                        ]
                                                                            ?.machine_photos
                                                                    }
                                                                    fileRootPath={
                                                                        fileRootPath
                                                                    }
                                                                />
                                                            </Form.Item>
                                                        </Col>
                                                        <Col span={24}>
                                                            <Button
                                                                onClick={() =>
                                                                    remove(name)
                                                                }
                                                                danger
                                                            >
                                                                Remove
                                                            </Button>
                                                        </Col>
                                                    </Row>
                                                )
                                            )}
                                            <Form.Item>
                                                <Button
                                                    type="dashed"
                                                    onClick={() => add()}
                                                    block
                                                    icon={<PlusOutlined />}
                                                >
                                                    Add Machinery
                                                </Button>
                                            </Form.Item>
                                        </>
                                    )}
                                </Form.List>
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Minimum Order Quantity (MOQ) Requirements
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="general_moq_policy"
                                label="General MOQ Policy"
                            >
                                <Input.TextArea rows={2} />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="sample_order_moq"
                                label="Sample Order MOQ"
                            >
                                <Input type="number" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="production_order_moq"
                                label="Production Order MOQ (Min Price)"
                            >
                                <Input />
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Factory & Production Visuals
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="production_facility_photos"
                                label="Production Facility Photo"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('production_facility_photos')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Production Facility Photo
                                    </Button>
                                </Upload>
                                {formData?.production_facility_photos && (
                                    <FilePreview
                                        filePath={
                                            formData?.production_facility_photos
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="production_line_photos"
                                label="Production Line Photo"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('production_line_photos')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Production Line Photo
                                    </Button>
                                </Upload>
                                {formData?.production_line_photos && (
                                    <FilePreview
                                        filePath={
                                            formData?.production_line_photos
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="qc_area_photos"
                                label="Quality Control Area Photo"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('qc_area_photos')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Quality Control Area Photo
                                    </Button>
                                </Upload>
                                {formData?.qc_area_photos && (
                                    <FilePreview
                                        filePath={formData?.qc_area_photos}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="warehouse_photos"
                                label="Warehouse Photo"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('warehouse_photos')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Warehouse Photo
                                    </Button>
                                </Upload>
                                {formData?.warehouse_photos && (
                                    <FilePreview
                                        filePath={formData?.warehouse_photos}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Quality Assurance
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="quality_control_process"
                                label="Quality Control Process"
                            >
                                <Input.TextArea rows={3} />
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="testing_capabilities"
                                label="Testing Capabilities"
                            >
                                <Input.TextArea rows={3} />
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Business Performance
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="export_markets"
                                label="Export Markets"
                            >
                                <Input type="text" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="years_in_export"
                                label="Years in Export"
                            >
                                <Input type="number" />
                            </Form.Item>
                        </Col>
                        <Col span={8}>
                            <Form.Item
                                name="average_lead_time"
                                label="Average Lead Time"
                            >
                                <Input placeholder="e.g. 2 weeks, 30 days" />
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Sustainability & Compliance
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="environmental_cert_text"
                                label="Environmental Certifications"
                            >
                                <Input />
                            </Form.Item>
                            <Form.Item
                                name="environmental_cert_upload"
                                label="Environmental Certification Upload"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('environmental_cert_upload')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Environmental Certification
                                    </Button>
                                </Upload>
                                {formData?.environmental_cert_upload && (
                                    <FilePreview
                                        filePath={
                                            formData?.environmental_cert_upload
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={12}>
                            <Form.Item
                                name="social_compliance_text"
                                label="Social Compliance Certifications"
                            >
                                <Input />
                            </Form.Item>
                            <Form.Item
                                name="social_compliance_upload"
                                label="Social Compliance Certification Upload"
                                valuePropName="file"
                                getValueFromEvent={(e) => e.file}
                            >
                                <Upload
                                    {...props('social_compliance_upload')}
                                    showUploadList={true}
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Compliance Certification
                                    </Button>
                                </Upload>
                                {formData?.social_compliance_upload && (
                                    <FilePreview
                                        filePath={
                                            formData?.social_compliance_upload
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Form.Item
                                name="sustainable_practices"
                                label="Sustainable Practices"
                            >
                                <Input.TextArea rows={3} />
                            </Form.Item>
                        </Col>
                        <Col span={24}>
                            <Divider orientation="left">
                                <Title level={4} style={{ marginBottom: 0 }}>
                                    Products
                                </Title>
                            </Divider>
                        </Col>
                        <Col span={24}>
                            <Form.Item
                                name="core_product_photos"
                                label="Core Product Photos"
                                valuePropName="fileList"
                                getValueFromEvent={(e) => e.fileList}
                            >
                                <Upload
                                    {...props('core_product_photos')}
                                    listType="picture"
                                    multiple
                                >
                                    <Button icon={<UploadOutlined />}>
                                        Upload Product Photos
                                    </Button>
                                </Upload>
                                {formData?.core_product_photos && (
                                    <FilePreviewMultiple
                                        filePath={formData?.core_product_photos}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Form.Item>
                        </Col>

                        {/* Location */}
                        {/* <Form.Item
          name="location"
          label="Company Location"
          rules={[{ required: true, message: "Please enter your company location" }]}
        >
          <Input placeholder="Enter your company location" />
        </Form.Item> */}

                        {/* Submit Button */}
                        <Col
                            span={8}
                            style={{
                                display: 'flex'
                                //justifyContent: 'flex-end'
                                // marginTop: '20px'
                            }}
                        >
                            <Form.Item>
                                <Button
                                    type="primary"
                                    htmlType="submit"
                                    loading={loading}
                                >
                                    Update Account
                                </Button>
                            </Form.Item>
                        </Col>
                    </Row>
                </Form>
            </div>

            <Modal
                title={
                    <Title level={4} style={{ margin: 0 }}>
                        Factory Profile
                    </Title>
                }
                open={isModalVisible}
                onCancel={() => setIsModalVisible(false)}
                footer={null}
                width={1000}
                height={680}
                bodyStyle={{ padding: '5px' }}
                centered
            >
                <Form layout="vertical">
                    <Space
                        direction="vertical"
                        size="middle"
                        style={{ width: '100%' }}
                    >
                        <Divider
                            orientation="left"
                            style={{ margin: '2px 0', fontSize: '16px' }}
                        >
                            Documents & Media
                        </Divider>
                        <Row gutter={[16, 16]}>
                            <Col span={6}>
                                <Text strong>Company Logo:</Text>
                                <br />
                                {userDetail?.company_logo && (
                                    <FilePreview
                                        filePath={userDetail?.company_logo}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Col>
                            <Col span={6}>
                                <Text strong>Company Portfolio:</Text>
                                <br />
                                {userDetail?.company_portflio && (
                                    <FilePreview
                                        filePath={userDetail?.company_portflio}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Col>
                            <Col span={6}>
                                <Text strong>Certificate:</Text>
                                <br />
                                {userDetail?.certificate && (
                                    <FilePreview
                                        filePath={userDetail?.certificate}
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Col>
                            <Col span={6}>
                                <Text strong>Import/Export Documents:</Text>
                                <br />
                                {userDetail?.import_export_document && (
                                    <FilePreview
                                        filePath={
                                            userDetail?.import_export_document
                                        }
                                        fileRootPath={fileRootPath}
                                    />
                                )}
                            </Col>
                        </Row>
                        <Divider
                            orientation="left"
                            style={{ margin: '2px 0', fontSize: '16px' }}
                        >
                            Basic Details
                        </Divider>
                        <Row gutter={[16, 16]}>
                            <Col span={8}>
                                <Text strong>Company:</Text>
                                <br />
                                {userDetail?.company}
                            </Col>
                            <Col span={8}>
                                <Text strong>Address:</Text>
                                <br />
                                {userDetail?.address}
                            </Col>
                            <Col span={8}>
                                <Text strong>Contact:</Text>
                                <br />
                                {userDetail?.contact}
                            </Col>
                            <Col span={8}>
                                <Text strong>GST No:</Text>
                                <br />
                                {userDetail?.gst_no}
                            </Col>
                            <Col span={8}>
                                <Text strong>Industry:</Text>
                                <br />
                                {userDetail?.industry}
                            </Col>
                            <Col span={8}>
                                <Text strong>Employee Count:</Text>
                                <br />
                                {userDetail?.employeeCount}
                            </Col>
                            {/* <Col span={8}><Text strong>Facilities:</Text><br />{userDetail?.facilities}</Col> */}
                            <Col span={8}>
                                <Text strong>Location:</Text>
                                <br />
                                {userDetail?.address}
                            </Col>
                            <Col span={8}>
                                <Text strong>ISO Certification:</Text>
                                <br />
                                {userDetail?.iso_certification === '1'
                                    ? 'Yes'
                                    : 'No'}
                            </Col>
                            <Col span={8}>
                                <Text strong>Freezone:</Text>
                                <br />
                                {userDetail?.freezone === '1' ? 'Yes' : 'No'}
                            </Col>
                        </Row>
                        <Divider
                            orientation="left"
                            style={{ margin: '2px 0', fontSize: '16px' }}
                        >
                            Additional Info
                        </Divider>
                        <Row gutter={[16, 16]}>
                            <Col span={8}>
                                <Text strong>URN:</Text>
                                <br />
                                {userDetail?.urn}
                            </Col>
                            <Col span={8}>
                                <Text strong>Company Website:</Text>
                                <br />
                                <a
                                    href={userDetail?.company_website}
                                    target="_blank"
                                    rel="noreferrer"
                                >
                                    {userDetail?.company_website}
                                </a>
                            </Col>
                            <Col span={8}>
                                <Text strong>Company Type:</Text>
                                <br />
                                {userDetail?.company_type}
                            </Col>
                            <Col span={8}>
                                <Text strong>About Us:</Text>
                                <br />
                                {userDetail?.about_us}
                            </Col>
                            <Col span={8}>
                                <Text strong>Key Customers:</Text>
                                <br />
                                {userDetail?.key_customers}
                            </Col>
                            <Col span={8}>
                                <Text strong>Past Project:</Text>
                                <br />
                                {userDetail?.past_project}
                            </Col>
                            <Col span={8}>
                                <Text strong>Annual Turnover:</Text>
                                <br />
                                {userDetail?.anual_turnover}
                            </Col>
                            <Col span={8}>
                                <Text strong>Year of Establishment:</Text>
                                <br />
                                {userDetail?.year_of_establishment}
                            </Col>
                            {/* <Col span={8}><Text strong>IEC Code:</Text><br />{userDetail?.iec_code}</Col> */}
                        </Row>

                        <Divider
                            orientation="left"
                            style={{ margin: '2px 0', fontSize: '16px' }}
                        >
                            Operations
                        </Divider>
                        <Row gutter={[16, 16]}>
                            <Col span={8}>
                                <Text strong>Manufacturing Process:</Text>
                                <br />
                                {(userDetail?.manufacturing_process || '')
                                    .split(',')
                                    .map(
                                        (id) =>
                                            manufacturingProcess.find(
                                                (p) => p.id === id
                                            )?.process_name
                                    )
                                    .filter(Boolean)
                                    .map((name) => (
                                        <Tag key={name}>{name}</Tag>
                                    ))}
                            </Col>
                            <Col span={8}>
                                <Text strong>Services:</Text>
                                <br />
                                {(userDetail?.services || '')
                                    .split(',')
                                    .map((service) => service.trim())
                                    .filter(Boolean)
                                    .map((service) => (
                                        <Tag key={service}>{service}</Tag>
                                    ))}
                            </Col>
                        </Row>
                    </Space>
                </Form>
            </Modal>
        </>
    );
};

export default SupplierAccount;
