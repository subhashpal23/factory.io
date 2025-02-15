import React, { useState } from "react";
import { Input, Tree, Typography, Card, Space } from "antd";
import { SearchOutlined } from "@ant-design/icons";

const { Text } = Typography;

const treeData = [
  {
    title: (
      <>
        <Text strong>United States</Text> <Text type="secondary">(8041)</Text>
      </>
    ),
    key: "us",
    children: [
      {
        title: (
          <>
            <Text>Alabama</Text> <Text type="secondary">(107)</Text>
          </>
        ),
        key: "alabama",
        children: [
          { title: "Abbeville (2)", key: "abbeville" },
          { title: "Albertville (1)", key: "albertville" },
          { title: "Andalusia (1)", key: "andalusia" },
          { title: "Anniston (1)", key: "anniston" },
          { title: "Arab (2)", key: "arab" },
          { title: "Athens (2)", key: "athens" },
          { title: "Bay Minette (2)", key: "bay_minette" },
          { title: "Bessemer (1)", key: "bessemer" },
          { title: "Birmingham (5)", key: "birmingham" },
          { title: "Brewton (1)", key: "brewton" },
        ],
      },
    ],
  },
];

const capabilitiesData = [
  {
    title: (
      <>
        <Text strong>Capabilities</Text>
      </>
    ),
    key: "capabilities",
    children: [
      { title: "CNC Machining (8117)", key: "cnc_machining" },
      { title: "Injection Molding (1500)", key: "injection_molding" },
      { title: "Sheet Metal Fabrication (2300)", key: "sheet_metal" },
      { title: "3D Printing (800)", key: "3d_printing" },
      { title: "Casting (950)", key: "casting" },
      { title: "Forging (700)", key: "forging" },
    ],
  },
];

const materialData = [
  {
    title: (
      <>
        <Text strong>Material</Text>
      </>
    ),
    key: "material",
    children: [
      { title: "Aluminum (5000)", key: "aluminum" },
      { title: "Stainless Steel (4000)", key: "stainless_steel" },
      { title: "Brass (1200)", key: "brass" },
      { title: "Titanium (900)", key: "titanium" },
      { title: "Plastics (3000)", key: "plastics" },
    ],
  },
];

export const FilterByLocation = () => {
  // State to manage expanded keys for each Tree
  const [manulocationExpandedKeys, setManulocationExpandedKeys] = useState(["us"]);
  const [locationExpandedKeys, setLocationExpandedKeys] = useState(["alabama"]);
  const [capabilitiesExpandedKeys, setCapabilitiesExpandedKeys] = useState([
    "capabilities",
  ]);
  const [materialExpandedKeys, setMaterialExpandedKeys] = useState(["material"]);

  return (
    <Space small direction="vertical">
      <Card title="MANUFACTURING LOCATION" style={{ width: 300, padding: "5px" }}>
        <Input
          placeholder="Search Locations"
          prefix={<SearchOutlined />}
          style={{ marginBottom: 10 }}
        />
        <Tree
          checkable
          expandedKeys={manulocationExpandedKeys}
          onExpand={(keys) => setLocationExpandedKeys(keys)}
          defaultExpandAll
          treeData={treeData}
        />
      </Card>

      <Card title="FILTER BY LOCATION" style={{ width: 300, padding: "10px" }}>
        <Input
          placeholder="Search Locations"
          prefix={<SearchOutlined />}
          style={{ marginBottom: 10 }}
        />
        <Tree
          checkable
          expandedKeys={locationExpandedKeys}
          onExpand={(keys) => setLocationExpandedKeys(keys)}
          defaultExpandAll
          treeData={treeData}
        />
      </Card>

      <Card title="CAPABILITIES" style={{ width: 300, padding: "10px" }}>
        <Input
          placeholder="Search capabilities"
          prefix={<SearchOutlined />}
          style={{ marginBottom: 10 }}
        />
        <Tree
          checkable
          expandedKeys={capabilitiesExpandedKeys}
          onExpand={(keys) => setCapabilitiesExpandedKeys(keys)}
          defaultExpandAll
          treeData={capabilitiesData}
        />
      </Card>

      <Card title="MATERIALS" style={{ width: 300, padding: "10px" }}>
        <Input
          placeholder="Search materials"
          prefix={<SearchOutlined />}
          style={{ marginBottom: 10 }}
        />
        <Tree
          checkable
          expandedKeys={materialExpandedKeys}
          onExpand={(keys) => setMaterialExpandedKeys(keys)}
          defaultExpandAll
          treeData={materialData}
        />
      </Card>
    </Space>
  );
};

export default FilterByLocation;
