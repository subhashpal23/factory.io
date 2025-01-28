import { SolutionOutlined } from '@ant-design/icons';
import RfqList from '../pages/RfqList';
import OpenRFQs from '../pages/OpenRFQs';
import AcceptedRfqs from '../pages/AcceptedRfqs';
import ManageBuyers from '../pages/ManageBuyers';
import CreateQuote from '../pages/CreateQuote';
import ManageCompatibiility from '../pages/ManageCompatibiility';
import HomeConsumer from '../pages/HomeConsumer';
import CreateRFQ from '../pages/CreateRFQ';
import POList from '../pages/POList';
import CreatePO from '../pages/CreatePO';
import ManageSuppliers from '../pages/ManageSuppliers';
import ManageItemLibrary from '../pages/ManageItemLibrary';
import QuotesList from '../pages/QuotesList';
import RfqReceived from '../pages/RfqReceived';
import AdminRfqList from '../pages/admin/AdminRfqList';
export const industriesType = [
    'Aerospace',
    'Agriculture',
    'Automotive',
    'Aviation & Aerospace',
    'Construction',
    'Consulting',
    'Consumer Electronics',
    'Consumer Products',
    'Defense',
    'Design',
    'Electrical/Electronic Manufacturing',
    'Energy',
    'EV',
    'FMCG',
    'General Engineering',
    'Health Care',
    'HVAC',
    'Import and Export',
    'Industrial Automation',
    'Logistics and Supply Chain',
    'Machinery',
    'Mechanical or Industrial Engineering',
    'Medical Devices',
    'Nuclear',
    'Oil & Energy',
    'Outsourcing/Offshoring',
    'Packaging and Containers',
    'Pharmaceuticals',
    'Power',
    'Railways',
    'Research',
    'Solar'
  ];
  
  export const CountryCodes = [
    {
      "name": "Afghanistan",
      "code": "+93",
      "flag": "af"
    },
    {
      "name": "Albania",
      "code": "+355",
      "flag": "al"
    },
    {
      "name": "Algeria",
      "code": "+213",
      "flag": "dz"
    },
    {
      "name": "Andorra",
      "code": "+376",
      "flag": "ad"
    },
    {
      "name": "Angola",
      "code": "+244",
      "flag": "ao"
    },
    {
      "name": "Argentina",
      "code": "+54",
      "flag": "ar"
    },
    {
      "name": "Australia",
      "code": "+61",
      "flag": "au"
    },
    {
      "name": "Austria",
      "code": "+43",
      "flag": "at"
    },
    {
      "name": "Bangladesh",
      "code": "+880",
      "flag": "bd"
    },
    {
      "name": "Belgium",
      "code": "+32",
      "flag": "be"
    },
    {
      "name": "Brazil",
      "code": "+55",
      "flag": "br"
    },
    {
      "name": "Canada",
      "code": "+1",
      "flag": "ca"
    },
    {
      "name": "China",
      "code": "+86",
      "flag": "cn"
    },
    {
      "name": "Denmark",
      "code": "+45",
      "flag": "dk"
    },
    {
      "name": "Egypt",
      "code": "+20",
      "flag": "eg"
    },
    {
      "name": "France",
      "code": "+33",
      "flag": "fr"
    },
    {
      "name": "Germany",
      "code": "+49",
      "flag": "de"
    },
    {
      "name": "India",
      "code": "+91",
      "flag": "in"
    },
    {
      "name": "Italy",
      "code": "+39",
      "flag": "it"
    },
    {
      "name": "Japan",
      "code": "+81",
      "flag": "jp"
    },
    {
      "name": "Mexico",
      "code": "+52",
      "flag": "mx"
    },
    {
      "name": "Netherlands",
      "code": "+31",
      "flag": "nl"
    },
    {
      "name": "Nigeria",
      "code": "+234",
      "flag": "ng"
    },
    {
      "name": "Pakistan",
      "code": "+92",
      "flag": "pk"
    },
    {
      "name": "Russia",
      "code": "+7",
      "flag": "ru"
    },
    {
      "name": "Saudi Arabia",
      "code": "+966",
      "flag": "sa"
    },
    {
      "name": "South Africa",
      "code": "+27",
      "flag": "za"
    },
    {
      "name": "Spain",
      "code": "+34",
      "flag": "es"
    },
    {
      "name": "Sweden",
      "code": "+46",
      "flag": "se"
    },
    {
      "name": "United Arab Emirates",
      "code": "+971",
      "flag": "ae"
    },
    {
      "name": "United Kingdom",
      "code": "+44",
      "flag": "gb"
    },
    {
      "name": "United States",
      "code": "+1",
      "flag": "us"
    }
  ]
  
  export const MenuItems = [
    {id:1,role_type:'supplier',label:'RFQs Received',iconLabel: <SolutionOutlined />, component: <RfqReceived />},
    {id:2,role_type:'supplier',label:'Open RFQs',iconLabel:<SolutionOutlined />, component: <OpenRFQs />},
    {id:3,role_type:'supplier',label:'Accepted RFQs',iconLabel:<SolutionOutlined />, component: <AcceptedRfqs />},
    {id:4,role_type:'supplier',label:'Manage Buyers',iconLabel:<SolutionOutlined />, component: <ManageBuyers />},
    {id:5,role_type:'supplier',label:'Create Quote',iconLabel:<SolutionOutlined />, component: <CreateQuote />},
    {id:6,role_type:'supplier',label:'Manage Compatibiility',iconLabel:<SolutionOutlined />, component: <ManageCompatibiility />},
    {id:7,role_type:'consumer',label:'Home(Dashboard)',iconLabel:<SolutionOutlined />, component: <HomeConsumer />},
    {id:8,role_type:'consumer',label:'RFQ List',iconLabel:<SolutionOutlined />, component: <RfqList />},
    {id:9,role_type:'consumer',label:'Create RFQ',iconLabel:<SolutionOutlined />, component: <CreateRFQ />},
    {id:10,role_type:'consumer',label:'PO List',iconLabel:<SolutionOutlined />, component: <POList />},
    {id:11,role_type:'consumer',label:'Create PO',iconLabel:<SolutionOutlined />, component: <CreatePO />},
    {id:12,role_type:'consumer',label:'Manage Suppliers',iconLabel:<SolutionOutlined />, component: <ManageSuppliers />},
    {id:13,role_type:'consumer',label:'Manage Item Library',iconLabel:<SolutionOutlined />, component: <ManageItemLibrary />},
    {id:14,role_type:'consumer',label:'Quotes List',iconLabel:<SolutionOutlined />, component: <QuotesList />},
    {id: 15,role_type: 'super_admin',label: 'RFQ Management',iconLabel: <SolutionOutlined />, component: <></>,
      children: [
        { id: 1500, label: 'RFQ List', component: <AdminRfqList /> },
        { id: 1501, label: 'Assigned To Supplier', component: <AdminRfqList />, props: { filter: 'supplierAssigned' } },
        { id: 1502, label: 'Assigned To Consumer', component: <AdminRfqList />, props: { filter: 'consumerAssigned' } }
      ]
    },
  ]



  