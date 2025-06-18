`ifndef TOP_ENV_SV
`define TOP_ENV_SV

class top_env extends uvm_env;
  `uvm_component_utils(top_env)


  adder_uvc_agent m_adder_agent;
  adder_uvc_config m_adder_config;
  top_scoreboard m_scoreboard;
  top_coverage m_coverage;
  top_vsqr        vsqr;


extern function new(string name, uvm_component parent);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
endclass: top_env


function top_env::new(string name, uvm_component parent);
super.new(name,parent);
endfunction:new

function void top_env::build_phase(uvm_phase phase);
//instanciamos el archivo de configuracion
m_adder_config = adder_uvc_config::type_id::create("m_adder_config");
m_adder_config.is_active = UVM_ACTIVE;
uvm_config_db#(adder_uvc_config)::set(this,"m_adder_agent*","config",m_adder_config);
//instaciar el Agente
m_adder_agent= adder_uvc_agent::type_id::create("m_adder_agent",this);
m_coverage = top_coverage::type_id::create("m_adder_coverage",this);
m_scoreboard= top_scoreboard::type_id::create("m_adder_scoreboard",this);
vsqr = top_vsqr::type_id::create("vsqr",this);
endfunction: build_phase

function void top_env::connect_phase(uvm_phase phase);
vsqr.m_adder_sequencer = m_adder_agent.m_sequencer;

m_adder_agent.analysis_port.connect(m_scoreboard.adder_imp_export);
m_adder_agent.analysis_port.connect(m_coverage.adder_imp_export);

endfunction: connect_phase


`endif  // TOP_TEST_ENV_SV
