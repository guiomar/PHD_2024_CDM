% Script generated by Brainstorm (07-Jan-2025)

% Input files
sFiles = {...
    'HC1/@rawsub-037_task-eyesclosed_eeg_notch_band_notch_notch/data_0raw_sub-037_task-eyesclosed_eeg_notch_band_notch_notch.mat'};

% Start a new report
bst_report('Start', sFiles);

% Process: Refine registration
sFiles = bst_process('CallProcess', 'process_headpoints_refine', sFiles, [], ...
    'tolerance', 0);

% Process: Power spectrum density (Welch)
sFiles = bst_process('CallProcess', 'process_psd', sFiles, [], ...
    'timewindow',  [], ...
    'win_length',  4, ...
    'win_overlap', 50, ...
    'units',       'physical', ...  % Physical: U2/Hz
    'sensortypes', 'EEG', ...
    'win_std',     0, ...
    'edit',        struct(...
         'Comment',         'Power,FreqBands', ...
         'TimeBands',       [], ...
         'Freqs',           {{'delta', '2, 4', 'mean'; 'theta', '5, 7', 'mean'; 'alpha', '8, 12', 'mean'; 'beta', '15, 29', 'mean'; 'gamma1', '30, 59', 'mean'; 'gamma2', '60, 90', 'mean'}}, ...
         'ClusterFuncTime', 'none', ...
         'Measure',         'power', ...
         'Output',          'all', ...
         'SaveKernel',      0));

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
% bst_report('Email', ReportFile, username, to, subject, isFullReport);

% Delete temporary files
% gui_brainstorm('EmptyTempFolder');

