% Script to perform a Qualification Plan workflow
% Qualification Plan Workflow developed with Matlab 2017b
% --------------------------------------------------------------

close all
clear all
tic

% --------------------------------------------------------------
% replace qualificationRunnerFolder and markdownJoinerFolder with your paths
addpath(genpath('C:\CompletSetup_SBSuite\QualificationFramework\Version_2.3\ReportingEngine_3.0.1.53'))
qualificationRunnerFolder = 'C:\CompletSetup_SBSuite\QualificationFramework\Version_3.3\QualificationRunner_12.0.1';
markdownJoinerFolder = 'C:\CompletSetup_SBSuite\QualificationFramework\Version_3.3\markdown-joiner_1.2.0.8';
%PKSimPortableFolder = 'C:\Software\PK-Sim_11.0.9999';

% --------------------------------------------------------------
% replace baseDir and qualificationPlanName with your paths
%
% assuming the following structure
%   baseDir
%   - input
%      - qualificationPlanName
%   - re_input
%   - re_output
%   - report
%

baseDir = fullfile(cd);
qualificationPlanName = 'qualification_plan.json';

% In case your folder structure is different from assumed above, 
% qualificationPlan, REInput_path, REOutput_path and ReportOutput_path must be adjusted as well 
%
% - REInput_path: input path for the Reporting engine 
%                 (corresponds to the output path defined in the Qualification Runner)
%
% - REOutput_path: outputs of the Reporting Engine will be created here
%                  CAUTION: if the folder is not empty, its contents will be deleted
%
% - ReportOutput_path: final report will be generated here
qualificationPlan = fullfile(baseDir,'input',qualificationPlanName);
REInput_path = fullfile(baseDir,'re_input');
REOutput_path = fullfile(baseDir,'re_output');
ReportOutput_path=fullfile(baseDir,'report');

if exist(fullfile(REInput_path),'dir')>0 rmdir(fullfile(cd,'re_input'),'s'); end
if exist(fullfile(REOutput_path),'dir')>0 rmdir(fullfile(cd,'re_output'),'s'); end
if exist(fullfile(ReportOutput_path),'dir')>0 rmdir(fullfile(cd,'report'),'s'); end

% --------------------------------------------------------------
% STEP #1: start qualification runner to generate inputs for the reporting engine
%startQualificationRunner(qualificationRunnerFolder, qualificationPlan, REInput_path, ['-p ' PKSimPortableFolder]);
startQualificationRunner(qualificationRunnerFolder, qualificationPlan, REInput_path);

% --------------------------------------------------------------
% STEP #2: start reporting engine
% Get the Configuration Plan Settings
reportConfigurationPlan = 'report-configuration-plan.json';
[WSettings, ConfigurationPlan, TaskList, ObservedDataSets] = initializeQualificationWorkflow(reportConfigurationPlan, REInput_path, REOutput_path);

%OPTIONAL: set watermark. If set, it will appear in all generated plots
WSettings.Watermark = '';

% run the Worklfow tasklist of ConfigurationPlan
SubunitsForDDIPlot = {'Perpetrator','Victim'}; % e.g. {'Mechanism', 'Perpetrator', 'Victim'}
runQualificationWorkflow(WSettings, ConfigurationPlan, TaskList, ObservedDataSets, SubunitsForDDIPlot);

QualificationWorkflowTime = toc/60;
fprintf('\n Qualification Workflow Duration: %0.1f minutes \n', QualificationWorkflowTime);

% --------------------------------------------------------------
% STEP #3: call MarkdownJoiner to combine Reporting Engine output into the final report
MarkdownJoiner_path=fullfile(markdownJoinerFolder,'markdown-joiner.exe');

% alternative #1: ReportOutput_path must be empty. If not, report generation will fail
status = system(['"' MarkdownJoiner_path '" -i "' REOutput_path '" -o "' ReportOutput_path '"']);

% alternative #2: (CAUTION) ReportOutput_path will be cleared first
%status = system(['"' MarkdownJoiner_path '" -i "' REOutput_path '" -o "' ReportOutput_path '" -f']);

if status~=0 error('MarkdownJoiner failed'); end

% Copy additional files

copyfile(fullfile(cd,'Input','Content','images'),fullfile(cd,'report','markdown_for_github','images'));
copyfile(fullfile(cd,'Input','Content','images'),fullfile(cd,'report','markdown_for_pdf','images'));

