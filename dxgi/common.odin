package dxgi

// Note: The following are defined in 'D3dcommon.h'.
//   It may be prudent to move these to their own
//   package such as 'd3d'. Although, both d3d11 and
//   d3d12 both depend on 'dxgi'. Adding another
//   package to the mix may just make things more
//   complicated.

Driver_Type :: enum int {
    Unknown   = 0,
    Hardware  = 1,
    Reference = 2,
    Null      = 3,
    Software  = 4,
    Warp      = 5,
}

Feature_Level :: enum int {
    D3D1_0_Core = 0x1000,
    D3D9_1      = 0x9100,
    D3D9_2      = 0x9200,
    D3D9_3      = 0x9300,
    D3D10_0	    = 0xa000,
    D3D10_1	    = 0xa100,
    D3D11_0	    = 0xb000,
    D3D11_1	    = 0xb100,
    D3D12_0	    = 0xc000,
    D3D12_1	    = 0xc100,
}

Primitive_Topology :: enum u32 {
    Undefined               = 0,
    Point_List              = 1,
    Line_List               = 2,
    Line_Strip              = 3,
    Triangle_List           = 4,
    Triangle_Strip          = 5,
    Line_List_Adjacent      = 10,
    Line_Strip_Adjacent     = 11,
    Triangle_List_Adjacent  = 12,
    Triangle_Strip_Adjacent = 13,
}