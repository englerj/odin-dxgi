package dxgi

foreign import "system:dxgi.lib"

@(default_calling_convention = "std")
foreign dxgi {
    @(link_name="CreateDXGIFactory2") create_factory_2 :: proc(flags: u32, riid: Guid, factory: ^^Factory) -> Hresult ---
}