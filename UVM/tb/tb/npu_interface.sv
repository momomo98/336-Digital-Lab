interface npu_interface(input clk, input rstn);
	
	//NPU write port
	logic				wr_sop_weight;
	logic				wr_eop_weight;
	logic				wr_vld_weight;
	logic    [31:0]     wr_data_weight;
	
	logic				wr_sop_data;		
	logic				wr_eop_data;
	logic				wr_vld_data;
	logic	 [31:0]     wr_data_data;
	
	//NPU read port
	logic				save_finish;
	
	logic				rd_sop_0;			
	logic				rd_sop_1;
	logic				rd_sop_2;
	logic				rd_sop_3;
	logic				rd_sop_4;
	logic				rd_sop_5;
	logic				rd_sop_6;
	logic				rd_sop_7;
	
	logic				rd_eop_0;
	logic               rd_eop_1;
	logic               rd_eop_2;
	logic               rd_eop_3;
	logic               rd_eop_4;
	logic               rd_eop_5;
	logic               rd_eop_6;
	logic               rd_eop_7;
	
	logic				rd_vld_0;
	logic               rd_vld_1;
	logic               rd_vld_2;
	logic               rd_vld_3;
	logic               rd_vld_4;
	logic               rd_vld_5;
	logic               rd_vld_6;
	logic               rd_vld_7;
	
	logic	[15:0]		rd_data_0;
	logic   [15:0]      rd_data_1;
	logic   [15:0]      rd_data_2;
	logic   [15:0]      rd_data_3;
	logic   [15:0]      rd_data_4;
	logic   [15:0]      rd_data_5;
	logic   [15:0]      rd_data_6;
	logic   [15:0]      rd_data_7;


	clocking wd_cb@(posedge clk);//weight_driver
		default input #1ps output #1ps;
		output         wr_sop_weight;
		output         wr_eop_weight;
		output         wr_vld_weight;
		output         wr_data_weight;
	endclocking
	
	clocking dd_cb@(posedge clk);//data_driver
		default input #1ps output #1ps;
		output         wr_sop_data;
		output         wr_eop_data;
		output         wr_vld_data;
		output         wr_data_data;
	endclocking
	
	clocking rm_cb@(posedge clk);//result_monitor
		default input #1ps output #1ps;
		input				save_finish;
	
	    output				rd_sop_0;			
	    output				rd_sop_1;
	    output				rd_sop_2;
	    output				rd_sop_3;
	    output				rd_sop_4;
	    output				rd_sop_5;
	    output				rd_sop_6;
	    output				rd_sop_7;
	    
	    input				rd_eop_0;
	    input               rd_eop_1;
	    input               rd_eop_2;
	    input               rd_eop_3;
	    input               rd_eop_4;
	    input               rd_eop_5;
	    input               rd_eop_6;
	    input               rd_eop_7;

	    input				rd_vld_0;
	    input               rd_vld_1;
	    input               rd_vld_2;
	    input               rd_vld_3;
	    input               rd_vld_4;
	    input               rd_vld_5;
	    input               rd_vld_6;
	    input               rd_vld_7;

	    input				rd_data_0;
	    input   		    rd_data_1;
	    input   		    rd_data_2;
	    input   		    rd_data_3;
	    input   		    rd_data_4;
	    input   		    rd_data_5;
	    input   		    rd_data_6;
	    input   		    rd_data_7;
		
	endclocking

endinterface

interface pe_interface(input clk, input rst_n);
                    
    logic i_clear;                    
    logic [15:0] i_weight;                   
    logic [15:0] i_map;                      
    logic [15:0] o_weight;                   
    logic [15:0] o_map;                      
    logic [15:0] o_result;        

  clocking cb_mon @(posedge clk);
    // USER: Add clocking block detail
    default input #1ps output #1ps;
    input i_clear, i_weight, i_map, o_weight, o_map, o_result;
  endclocking : cb_mon

endinterface

interface dual_port_ram_mem(input rst_n);
                    
    logic [15:0] mem [0:15];     

  clocking cb_mon @(negedge rst_n);
    // USER: Add clocking block detail
    default input #1ps output #1ps;
    input mem;
  endclocking : cb_mon
  
endinterface

interface ram_wr_control_data_interface(input clk, input rst_n);
                    
    logic wr_sop;
    logic wr_eop;
    logic wr_vld;
    logic [31:0] wr_data;
    
    logic ram_wr_en;
    logic [1:0] ram_wr_strb;
    logic [3:0] ram_wr_addr;
    logic [31:0] ram_wr_data;  

  clocking cb_mon @(posedge clk);
    // USER: Add clocking block detail
    default input #1ps output #1ps;
    input wr_sop, wr_eop, wr_vld, wr_data, ram_wr_en, ram_wr_strb, ram_wr_addr, ram_wr_data;
  endclocking : cb_mon
  
endinterface

interface ram_wr_control_weight_interface(input clk, input rst_n);
                    
    logic wr_sop;
    logic wr_eop;
    logic wr_vld;
    logic [31:0] wr_data;
    
    logic ram_wr_en;
    logic [1:0] ram_wr_strb;
    logic [3:0] ram_wr_addr;
    logic [31:0] ram_wr_data;   

  clocking cb_mon @(posedge clk);
    // USER: Add clocking block detail
    default input #1ps output #1ps;
    input wr_sop, wr_eop, wr_vld, wr_data, ram_wr_en, ram_wr_strb, ram_wr_addr, ram_wr_data;
  endclocking : cb_mon
  
endinterface

interface ram_rd_control_interface(input clk, input rst_n);
                    
    //rd start
    logic rd_sop;
    //dual-ram port
    logic ram_rd_en;
    logic [3:0] ram_raddr;
    logic [15:0] ram_rdata;
    //pe_port
    logic [15:0] pe_data;

  clocking cb_mon @(posedge clk);
    // USER: Add clocking block detail
    default input #1ps output #1ps;
    input rd_sop, ram_rd_en, ram_raddr, ram_rdata, pe_data;
  endclocking : cb_mon
  
endinterface
