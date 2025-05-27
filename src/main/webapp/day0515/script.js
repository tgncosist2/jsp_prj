document.addEventListener('DOMContentLoaded', function() {
    // Pagination functionality
    const prevButton = document.querySelector('.page-nav.prev');
    const nextButton = document.querySelector('.page-nav.next');
    const currentPage = document.querySelector('.page-number');
    
    let pageNumber = 1;
    const totalPages = 5; // Example total pages
    
    prevButton.addEventListener('click', function(e) {
        e.preventDefault();
        if (pageNumber > 1) {
            pageNumber--;
            updatePagination();
            // In a real application, you would fetch data for the new page here
            // fetchPageData(pageNumber);
        }
    });
    
    nextButton.addEventListener('click', function(e) {
        e.preventDefault();
        if (pageNumber < totalPages) {
            pageNumber++;
            updatePagination();
            // In a real application, you would fetch data for the new page here
            // fetchPageData(pageNumber);
        }
    });
    
    function updatePagination() {
        currentPage.textContent = pageNumber;
        
        // Disable/enable buttons based on current page
        prevButton.style.opacity = pageNumber === 1 ? '0.5' : '1';
        nextButton.style.opacity = pageNumber === totalPages ? '0.5' : '1';
    }
    
    // Initialize pagination state
    updatePagination();
    
    // Mobile menu toggle functionality could be added here
    
    // Example of how you might handle menu item clicks
    const menuItems = document.querySelectorAll('.sidebar-nav a');
    menuItems.forEach(item => {
        item.addEventListener('click', function(e) {
            // Remove active class from all items
            menuItems.forEach(i => i.classList.remove('active'));
            // Add active class to clicked item
            this.classList.add('active');
            
            // In a real application, you might load different content here
            // const section = this.getAttribute('data-section');
            // loadSection(section);
        });
    });
});