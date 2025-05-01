import React from 'react';
import { Modal, Typography, Form, Space, Divider, Row, Col, Tag } from 'antd';
import FilePreview from './FilePreview';

const { Title, Text } = Typography;

const SupplierPreviewModal = ({
  isModalVisible,
  setIsModalVisible,
  userDetail,
  fileRootPath,
  manufacturingProcess
}) => {
  return (
    <Modal
      title={<Title level={4} style={{ margin: 0 }}>Factory Profile</Title>}
      open={isModalVisible}
      onCancel={() => setIsModalVisible(false)}
      footer={null}
      width={1000}
      bodyStyle={{ padding: '5px' }}
      centered
    >
      <Form layout="vertical">
        <Space direction="vertical" size="middle" style={{ width: '100%' }}>

          <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Documents & Media</Divider>
          <Row gutter={[16, 16]}>
            {userDetail?.company_logo && (
              <Col span={6}><Text strong>Company Logo:</Text><br /><FilePreview filePath={userDetail.company_logo} fileRootPath={fileRootPath} /></Col>
            )}
            {userDetail?.company_portflio && (
              <Col span={6}><Text strong>Company Portfolio:</Text><br /><FilePreview filePath={userDetail.company_portflio} fileRootPath={fileRootPath} /></Col>
            )}
            {userDetail?.certificate && (
              <Col span={6}><Text strong>Certificate:</Text><br /><FilePreview filePath={userDetail.certificate} fileRootPath={fileRootPath} /></Col>
            )}
            {(userDetail?.import_export_document || userDetail?.files) && (
              <Col span={6}><Text strong>Import/Export Documents:</Text><br /><FilePreview filePath={userDetail.import_export_document || userDetail?.files} fileRootPath={fileRootPath} /></Col>
            )}
          </Row>

          <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Basic Details</Divider>
          <Row gutter={[16, 16]}>
            {userDetail?.company && <Col span={8}><Text strong>Company:</Text><br />{userDetail.company}</Col>}
            {userDetail?.address && <Col span={8}><Text strong>Address:</Text><br />{userDetail.address}</Col>}
            {userDetail?.contact && <Col span={8}><Text strong>Contact:</Text><br />{userDetail.contact}</Col>}
            {userDetail?.gst_no && <Col span={8}><Text strong>GST No:</Text><br />{userDetail.gst_no}</Col>}
            {userDetail?.industry && <Col span={8}><Text strong>Industry:</Text><br />{userDetail.industry}</Col>}
            {userDetail?.employeeCount && <Col span={8}><Text strong>Employee Count:</Text><br />{userDetail.employeeCount}</Col>}
            {userDetail?.address && <Col span={8}><Text strong>Location:</Text><br />{userDetail.address}</Col>}
            {userDetail && 'iso_certification' in userDetail && (
              <Col span={8}><Text strong>ISO Certification:</Text><br />{userDetail.iso_certification === '1' ? 'Yes' : 'No'}</Col>
            )}
            {userDetail && 'freezone' in userDetail && (
              <Col span={8}><Text strong>Freezone:</Text><br />{userDetail.freezone === '1' ? 'Yes' : 'No'}</Col>
            )}
          </Row>

          <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Additional Info</Divider>
          <Row gutter={[16, 16]}>
            {userDetail?.urn && <Col span={8}><Text strong>URN:</Text><br />{userDetail.urn}</Col>}
            {userDetail?.company_website && (
              <Col span={8}><Text strong>Company Website:</Text><br />
                <a href={userDetail.company_website} target="_blank" rel="noreferrer">{userDetail.company_website}</a>
              </Col>
            )}
            {userDetail?.company_type && <Col span={8}><Text strong>Company Type:</Text><br />{userDetail.company_type}</Col>}
            {userDetail?.about_us && <Col span={8}><Text strong>About Us:</Text><br />{userDetail.about_us}</Col>}
            {userDetail?.key_customers && <Col span={8}><Text strong>Key Customers:</Text><br />{userDetail.key_customers}</Col>}
            {userDetail?.past_project && <Col span={8}><Text strong>Past Project:</Text><br />{userDetail.past_project}</Col>}
            {userDetail?.anual_turnover && <Col span={8}><Text strong>Annual Turnover:</Text><br />{userDetail.anual_turnover}</Col>}
            {userDetail?.year_of_establishment && <Col span={8}><Text strong>Year of Establishment:</Text><br />{userDetail.year_of_establishment}</Col>}
            {userDetail?.country && <Col span={8}><Text strong>Country:</Text><br />{userDetail.country}</Col>}
          </Row>

          <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Operations</Divider>
          <Row gutter={[16, 16]}>
            {userDetail?.manufacturing_process && (
              <Col span={8}>
                <Text strong>Manufacturing Process:</Text><br />
                {userDetail.manufacturing_process
                  .split(',')
                  .map(id => manufacturingProcess.find(p => p.id === id)?.process_name)
                  .filter(Boolean)
                  .map(name => <Tag key={name}>{name}</Tag>)}
              </Col>
            )}
            {userDetail?.services && (
              <Col span={8}>
                <Text strong>Services:</Text><br />
                {userDetail.services
                  .split(',')
                  .map(service => service.trim())
                  .filter(Boolean)
                  .map(service => <Tag key={service}>{service}</Tag>)}
              </Col>
            )}
          </Row>

        </Space>
      </Form>
    </Modal>
  );
};

export default SupplierPreviewModal;
