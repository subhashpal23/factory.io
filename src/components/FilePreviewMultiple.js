import React from 'react';
import { Image } from 'antd';

const FilePreviewMultiple = ({ filePath, fileRootPath = '' }) => {
    if (!filePath || filePath === '/') return <>NA</>;

    let paths = [];

    // Convert JSON string to array, or use array directly
    if (typeof filePath === 'string') {
        try {
            paths = JSON.parse(filePath);
        } catch (e) {
            console.warn('Invalid JSON format for filePath:', filePath);
            return <>Invalid file data</>;
        }
    } else if (Array.isArray(filePath)) {
        paths = filePath;
    } else {
        return <>Invalid file data</>;
    }

    return (
        <div
            style={{
                display: 'flex',
                flexWrap: 'wrap',
                gap: '16px',
                alignItems: 'flex-start',
                marginTop: '8px'
            }}
        >
            {paths.map((path, index) => {
                const normalizedPath = `${fileRootPath}${path.replace(
                    /\\/g,
                    '/'
                )}`;
                const fileName = decodeURIComponent(path.split('/').pop());
                const isImage = /\.(jpg|jpeg|png|gif|bmp|svg|webp|avif)$/i.test(
                    path
                );

                return (
                    <div
                        key={index}
                        style={{
                            width: 120,
                            textAlign: 'center',
                            border: '1px solid #f0f0f0',
                            borderRadius: 8,
                            padding: 8,
                            background: '#fafafa'
                        }}
                    >
                        {isImage ? (
                            <Image
                                width={100}
                                height={100}
                                src={normalizedPath}
                                alt={fileName}
                                style={{ objectFit: 'cover', borderRadius: 4 }}
                            />
                        ) : (
                            <>
                                <div style={{ marginBottom: 8 }}>
                                    {fileName}
                                </div>
                                <a
                                    href={normalizedPath}
                                    download={fileName}
                                    style={{
                                        padding: '4px 8px',
                                        background: '#1890ff',
                                        color: '#fff',
                                        borderRadius: '4px',
                                        fontSize: 12,
                                        display: 'inline-block'
                                    }}
                                >
                                    View
                                </a>
                            </>
                        )}
                    </div>
                );
            })}
        </div>
    );
};

export default FilePreviewMultiple;
